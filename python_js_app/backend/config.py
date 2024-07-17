from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS # Allows us to send a request to the backend from a different URL. This allows the frontend to communicate with the backend.

# Initialize the flask application
app = Flask(__name__)

 # Disble the CORS error
CORS(app)

# Initialize some Database things
# Specify the location of teh sqlite database that we'll be storing on our machine
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///mydatabase.db"

# Disable tracking of modifications to database
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# Create instance of the database
db = SQLAlchemy(app)

# Any command we perform will be translated into sql and applied to the database