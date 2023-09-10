from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from users_api.models import User
from users_api.serializers import UserSerializer

@csrf_exempt
def users_resources(request):
  if request.method == 'GET':
    users = User.objects.all()
    serializer = UserSerializer(users, many=True)
    return JsonResponse(serializer.data, safe=False)
  
  elif request.method == 'POST':
    data = JSONParser().parse(request)
    print(data)
    serializer = UserSerializer(data=data)
    if serializer.is_valid():
      serializer.save()
      return JsonResponse(serializer.data, status=201)
    else:
      return JsonResponse(serializer.errors, status=422)
  
  elif request.method == 'DELETE':
    User.objects.all().delete()
    
@csrf_exempt
def users_resource(request, pk):
  try:
    user = User.objects.get(pk=pk)
  except User.DoesNotExist:
    return HttpResponse(status=404)
  
  if request.method == 'GET':
    serializer = UserSerializer(user)
    return JsonResponse(serializer.data, status=200)
  
  elif request.method == 'PATCH':
    data = JSONParser().parse(request)
    serializer = UserSerializer(user, data=data)
    if serializer.is_valid():
      serializer.save()
      return JsonResponse(serializer.data, status=200)
    else:
      return JsonResponse(serializer.errors, status=422)
  
  elif request.method == 'DELETE':
    user.delete()
    return HttpResponse(status=204)


