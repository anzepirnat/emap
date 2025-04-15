from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, Http404, JsonResponse, HttpResponseForbidden
from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
import random
from .models import Sequence, UserSequence, Results
from django.contrib.auth.decorators import login_required, user_passes_test
import ast
from django.core.exceptions import ValidationError
from .forms import UploadExcelForm
from .utils import excel_to_db, log, reset_auto_increment, pseudo_random, user_is_admin
from django.db import connection
import os
from django.conf import settings
from django.templatetags.static import static
import time
import json

IMAGE_LIST = [os.path.join("images", image) for image in os.listdir(os.path.join(settings.BASE_DIR, "static/images"))]


def landing_page(request):
    log.info("Landing page accessed")
    return render(request, "emapp/landing_page.html")

@login_required
def app(request):
    return render(request, "emapp/app.html")


def get_image(request):
    if request.method == "POST":
        
        try:
            image_name, image_idx, image_idx_in_set = pseudo_random(request.user.id)
        except Exception as e:
            log.error(f"Error getting image: {e}")
            return JsonResponse({"error": str(e)}, status=400)
        
        if image_name=="halfway-through" and image_idx==-1:
            result = Results(
                user_id=request.user.id,
                image=image_name,
                image_idx=image_idx,
                score=""
            )
            result.save()
            return JsonResponse({"message": "Halfway through the experiment"}, status=200)
        
        if image_name=="experiment-finished" and image_idx==101:
            return JsonResponse({"message": "Experiment finished"}, status=200)
        
        image_path = "images/" + image_name + ".jpg"
        image_url = static(image_path)
        response_data = {
            "image_url": image_url,
            "image_name": image_name,
            "image_idx": image_idx,
            "image_idx_in_set": image_idx_in_set
        }
        return JsonResponse(response_data)
    
    return JsonResponse({"error": "Invalid request"}, status=400)


def post_yes(request):
    if request.method == "POST":
        data = json.loads(request.body)
        image_name = data.get("image_name")
        image_idx = data.get("image_idx")
        if image_name and image_idx:
            result = Results(
                user_id=request.user.id,
                image=image_name,
                image_idx=image_idx,
                score="yes"
            )
            result.save()
            return JsonResponse({"message": "Result (yes) saved successfully!"}, status=200)
        return JsonResponse({"error": "Image name missing"}, status=400)
    return JsonResponse({"error": "Invalid request"}, status=400)

def post_no(request):
    if request.method == "POST":
        data = json.loads(request.body)
        image_name = data.get("image_name")
        image_idx = data.get("image_idx")
        if image_name and image_idx:
            result = Results(
                user_id=request.user.id,
                image=image_name,
                image_idx=image_idx,
                score="no"
            )
            result.save()
            return JsonResponse({"message": "Result (no) saved successfully!"}, status=200)
        return JsonResponse({"error": "Image name missing"}, status=400)
    return JsonResponse({"error": "Invalid request"}, status=400)


@login_required
@user_passes_test(user_is_admin)
def edit_data(request):
    if request.method == 'POST' and request.FILES['excel_file']:
        try:
            # Get new data
            excel_file = request.FILES['excel_file']
            log.debug("excel_file was obtained")
            
            # Delete old data
            Sequence.objects.all().delete()
            UserSequence.objects.all().delete()
            
            # Reset auto-increment counters
            reset_auto_increment('emapp_sequence')
            reset_auto_increment('emapp_usersequence')
            
            # Write new data
            result = excel_to_db(excel_file)
            log.debug(f"result is: {result}")
            
            return JsonResponse({'message': result}, status=200)
        
        except ValidationError as e:
            log.error("Validation error: %s", e)
            return JsonResponse({'error': str(e)}, status=400)

    # If it's a GET request, just render the page with the file upload form
    form = UploadExcelForm()
    return render(request, 'edit_data.html', {'form': form})

@login_required
@user_passes_test(user_is_admin)
def generate_users(request):
    if request.method == 'POST':
        try:
            num_users = int(request.POST.get('num_users', 0))
            if num_users <= 0:
                raise ValueError("Number of users must be positive")
            
            # Generate random usernames with a random library, each username is unique 6 digit number and each pws is unique 4 digit of numbers and letters
            usernames = []
            passwords = []
            while len(usernames) < num_users:
                username = str(random.randint(100000, 999999))
                password = ''.join(random.choices('0123456789abcdefghijklmnopqrstuvwxyz', k=4))
                password = password.strip()
                if username not in usernames:
                    usernames.append(username)
                    passwords.append(password)
            # Create users
            for username, password in zip(usernames, passwords):
                user = User.objects.create_user(username=username, password=password)
                user.save()
                log.info(f"User created successfully. Username: {username}, Password: {password}")
            
            # Make output file with all usernames and passwords and send it to the user to download
            output_file_path = os.path.join(settings.BASE_DIR, 'static', 'output', 'user_credentials.txt')
            log.info(f"Output file path: {output_file_path}")
            with open(output_file_path, 'w') as f:
                for username, password in zip(usernames, passwords):
                    f.write(f"Username: {username}, Password: {password}\n")
            log.info(f"User credentials saved to {output_file_path}")
            # Send file to user
            with open(output_file_path, 'rb') as f:
                response = HttpResponse(f.read(), content_type='text/plain')
                response['Content-Disposition'] = f'attachment; filename="user_credentials.txt"'
                return response
            
            messages.success(request, f"{num_users} users generated successfully.")
            return redirect('generate_users')
        
        except ValueError as e:
            messages.error(request, str(e))
        except FileNotFoundError as e:
            messages.error(request, f"File not found: {e}")
        except Exception as e:
            messages.error(request, f"An error occurred: {e}")
    return render(request, 'generate_users.html')