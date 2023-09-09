from fastapi import FastAPI

from db import ActiveUser
from user import User

app = FastAPI()

@app.get('/users')
def index():
  users = ActiveUser().all()
  return { 'users': users }

@app.get('/user/{id}')
def show(id: int):
  user = ActiveUser().find(id)
  return { 'user': user }

@app.post('/users')
def create(user: User):
  user = user.model_dump()
  ActiveUser().create(user)
  return user

@app.delete('/user/{id}')
def destroy(id: int):
  ActiveUser().destroy(id)
  return { 'message': 'User has been destroyed successfully' }

@app.delete('/users')
def destroy_all():
  ActiveUser().destroy_all()
  return { 'message': 'All users have been destroyed' }
