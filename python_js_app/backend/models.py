# This allows us to start with the data

# import the db instance from config
from config import db

# Define class: Database model represented as a python Class
class Contact(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    first_name = db.Column(db.String(80), unique = False, nullable = False)
    last_name = db.Column(db.String(80), unique = False, nullable = False)
    email = db.Column(db.String(120), unique = True, nullable = False)

    # pass json back and forth, btw the convention in json is camelCase
    # This json method is going to be used in our main.py file to convert python objects to json
    def to_json(self):
        return {
            "id": self.id,
            "firstName": self.first_name,
            "lastName": self.last_name,
            "email": self.email
        }