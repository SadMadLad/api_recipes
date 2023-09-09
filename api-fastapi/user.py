from pydantic import BaseModel
from datetime import date

class User(BaseModel):
  name: str
  age: int
  dob: str
  nationality: str
  programming_language: str = 'python/fastapi'
