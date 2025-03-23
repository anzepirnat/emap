from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, Http404, JsonResponse
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
import random
from .models import Sequence, UserSequence
from django.contrib.auth.decorators import login_required
import ast
from django.core.exceptions import ValidationError
from .forms import UploadExcelForm
from .utils import excel_to_db, log, reset_auto_increment, pseudo_random
from django.db import connection
import os
from django.conf import settings
from django.templatetags.static import static
import time

IMAGE_LIST = [os.path.join("images", image) for image in os.listdir(os.path.join(settings.BASE_DIR, "static/images"))]


def landing_page(request):
    log.info("Landing page accessed")
    return render(request, "emapp/landing_page.html")

@login_required
def app(request):
    return render(request, "emapp/app.html")


def get_image(request):
    if request.method == "POST":
        #time.sleep(2)
        user_sequences = UserSequence.objects.filter(user_id=request.user.id)
        new_image = static(pseudo_random(request.user.id))#random.choice(IMAGE_LIST)
        log.info(new_image)
        response_data = {
            "image_url": new_image
        }
        return JsonResponse(response_data)
    
    return JsonResponse({"error": "Invalid request"}, status=400)


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
