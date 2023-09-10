from django.db import models

class User(models.Model):
  name = models.CharField(max_length=100, blank=False)
  age = models.IntegerField(blank=False)
  dob = models.DateField(blank=False)
  nationality = models.CharField(max_length=100, blank=False)
  programming_language = models.CharField(max_length=100, blank=False, default='python/django')
