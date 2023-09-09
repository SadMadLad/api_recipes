from flask import Flask
from flask import request

from db import User

app = Flask(__name__)

@app.route('/users', methods=['GET'])
def index():
  users = User().all()
  return users

@app.route('/user/<int:id>', methods=['GET'])
def show(id: int):
  user = User().find(id)
  return user

@app.route('/users', methods=['POST'])
def create():
  user = request.get_json()['user']
  User().create(user)
  return { 'message': 'User created successfully' }

@app.route('/user/<int:id>', methods=['DELETE'])
def destroy(id: int):
  User().destroy(id)
  return { 'message': 'User has been destroyed successfully' }

@app.route('/users', methods=['DELETE'])
def destroy_all():
  User().destroy_all()
  return { 'message': 'All users have been destroyed' }
