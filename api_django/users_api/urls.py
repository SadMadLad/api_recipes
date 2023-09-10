from django.urls import path
from users_api import views

urlpatterns = [
    path('users/', views.users_resources),
    path('user/<int:pk>/', views.users_resource),
]
