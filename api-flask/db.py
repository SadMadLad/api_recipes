import sqlite3

class User:
  def __init__(self):
    self.conn = sqlite3.connect('api-database.db')
    self.cursor = self.conn.cursor()
  
  def all(self):
    res = self.cursor.execute('SELECT * FROM users')
    return res.fetchall()
  
  def find(self, id):
    res = self.cursor.execute('SELECT * FROM users WHERE id = ?', (id, ))
    return list(res.fetchone())
  
  def create(self, params):
    params = list(params.values()) + ['python/flask']
    self.cursor.execute('INSERT INTO users (name, age, dob, nationality, programming_language) VALUES (?, ?, ?, ?, ?)', tuple(params))
    self.conn.commit()

  def destroy_all(self):
    self.cursor.execute('DELETE FROM users')
    self.conn.commit()

  def destroy(self, id: int):
    self.cursor.execute('DELETE FROM users WHERE id = ?', (id, ))
    self.conn.commit()
