from django.urls import path

from . import views

urlpatterns = [
    path("", views.landing_page, name="landing_page"),
    path("app/", views.app, name="app"),
    path("edit-data/", views.edit_data, name="edit_data"),
    path('api/get-image/', views.get_image, name='get_new_image'),
]