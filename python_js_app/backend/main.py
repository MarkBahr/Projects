# imports, jsonify allows us to return json data. 
from flask import request, jsonify
# From our config.py file, import app and db
from config import app, db
# from our models.py file, import Contact class
from models import Contact

# The parameter of app.route("") is where we specify the endpoint of the route.
# The next line is an example of a decorator. /contacts is the route, and we only want to use the GET method for this url
# @app.route("/contacts", methods=["GET"])

# Get
@app.route("/contacts", methods=["GET"])
# Tell how to handle get requests sent to this route using a function
def get_contacts():
    # This uses SQLAlchemy to get all of the different contacts that exist inside of the Contact database, but the contacts are python objects
    contacts = Contact.query.all()
    
    # Because all of them are Python objects, we need to convert them to json
    # map takes all the elements from this list, applies a lambda function to them & gives us the result in a new map object, which we convert to a list
    json_contacts = list(map(lambda x: x.to_json(), contacts))
    
    # return the contacts after they're converted to json. The "contacts" key in the python dict is associated with json_contacts
    return jsonify({"contacts": json_contacts})


# Post
@app.route("/create_contact", methods=["POST"])

#Tell how to handle post requests
def create_contact():
    # Get the data for each attribute
    first_name = request.json.get("firstName")
    last_name = request.json.get("lastName")
    email = request.json.get("email")

    # if not included, return message
    if not first_name or not last_name or not email:
        return (
            jsonify({"message": "You must include a first name, last name and email"}), 400,
        )

    # Create new_contact entry in database (a nwe Contact object), passing in fields into the constructor
    new_contact = Contact(first_name=first_name, last_name = last_name, email = email)

    # Add it to database
    try:
        # Add new contact
        db.session.add(new_contact)
        # Commit the changes (write into the database permanantly)
        db.session.commit()
    except Exception as e:
        # return the exception to the user
        return jsonify({"message": str(e)}), 400
    
    # if no errors occured
    return jsonify({"message": "User created!"}), 201


# Update
@app.route("/update_contact/<int:user_id>", methods = ["PATCH"])

# Tell how to handle patch (update) requests, notice the variable name matches the path parameter for update_contact
def update_contact(user_id):
    # find the user that has that specific id
    contact = Contact.query.get(user_id)

    if not contact:
        return jsonify({"message": "User not found"}), 404

    data = request.json
    
    # data.get says if there is new data for the json request for first name, use that data, otherwise leave it at whatever it was (contact.first_name). .get looks for a key (the key you specify as the first parameter) inside of a dictionary. if the key exists in that dictionary, it returns to us that value. If it doesn't exist, it returns the 2nd parameter.
    # If the data has changed, updtate it. If it has not, keep it the same.
    contact.first_name = data.get("firstName", contact.first_name)
    contact.last_name = data.get("lastName", contact.last_name)
    contact.email = data.get("email", contact.email)

    db.session.commit()

    return jsonify({"message": "User updated."}), 200


# DELETE
@app.route("/delete_contact/<int:user_id>", methods = ["DELETE"])
# How to handle deletions
def delete_contact(user_id):
    contact = Contact.query.get(user_id)

    if not contact:
        return jsonify({"message": "User not found"}), 404
    
    db.session.delete(contact)
    db.session.commit()

    return jsonify({"message": "User deleted!"}), 200



# If main.py is run, then ...
if __name__ == "__main__":

    # instantiate database  get the context
    with app.app_context():
        # create the different models in our database if not already created i.e. spin up the database
        db.create_all()
   
    # Run this code
    app.run(debug=True)
