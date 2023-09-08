# frozen_string_literal: true

require 'sinatra'
require 'pry'
require 'sqlite3'
require 'json'

require_relative 'helpers'

SQLITE3_DATABASE_PATH = '../../api-database.db'

db = SQLite3::Database.new SQLITE3_DATABASE_PATH

get '/users' do
  users = db.execute('SELECT * FROM users')
  users.map { |user| users_hash(user) }.to_json
end

get '/user/:id' do
  user = db.execute('SELECT * FROM users WHERE id = ?', params[:id]).first
  user_hash(user).to_json
end

post '/users' do
  user = required_params(params, %w[name age dob nationality]) + ['ruby/sinatra']
  db.execute('INSERT INTO users (name, age, dob, nationality, programming_language) VALUES (?, ?, ?, ?, ?)', user)
  'User created successfully'
rescue StandardError
  status 500
  'Could not create user'
end

delete '/user/:id' do
  db.execute('DELETE FROM user WHERE id = ?', params[:id])
  'User deleted successfully'
rescue StandardError
  status 500
  'Could not delete user'
end

delete '/users' do
  db.execute('DELETE FROM users')
  'All users deleted successfully'
rescue StandardError
  status 500
  'Could not delete users'
end
