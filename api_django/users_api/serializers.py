from rest_framework import serializers
from users_api.models import User

class UserSerializer(serializers.ModelSerializer):
  class Meta:
    model = User
    fields = ['id', 'name', 'age', 'dob', 'nationality', 'programming_language']
