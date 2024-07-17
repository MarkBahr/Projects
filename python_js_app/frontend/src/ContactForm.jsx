// Create a Form
import { useState } from "react";

// Arrow function, take in props existingContact as an empty object
const ContactForm = ({ existingContact = {}, updateCallback }) => {
  // If existingContact put in the info, otherwise(or ||) empty string
  const [firstName, setFirstName] = useState(existingContact.firstName || "");
  const [lastName, setLastName] = useState(existingContact || "");
  const [email, setEmail] = useState(existingContact || "");

  //If object of at least 1 entry passed, then we're updating it. If it has 0, then we're creating a new contact
  const updating = Object.entries(existingContact).length !== 0;

  // WE include async here and await below
  const onSubmit = async (e) => {
    // We're not going to refresh the page automatically
    e.preventDefault();

    // JavaScript object to set up post request
    const data = {
      // state for the needed variables
      firstName,
      lastName,
      email,
    };
    // Specify url, with dynamic data: if updating, then update. If not, create contact
    const url =
      "http://127.0.0.1:5000/" +
      (updating ? `update_contact/${existingContact.id}` : "create_contact");

    // set up options for request, when not doing get request, you have to specify,
    const options = {
      method: "POST",
      // We're about to submit json, we have to let the api know
      headers: {
        "Content-Type": "application/json",
      },
      // Convert to a valid JSON object
      body: JSON.stringify(data),
    };

    // send request
    const response = await fetch(url, options);

    // If request not successful
    if (response.status !== 201 && response.status !== 200) {
      // alert user
      const data = await response.json();
      alert(data.message);
    } else {
      // Tell app.jsx, we finished, close modal, update data from contact list
      updateCallback();
    }
  };

  return (
    // When Create Contact button, then execute onSubmit function
    <form onSubmit={onSubmit}>
      <div>
        <label htmlFor="firstName">First Name</label>
        <input
          type="text"
          id="firstName"
          value={firstName}
          onChange={(e) => setFirstName(e.target.value)}
        ></input>
      </div>
      <div>
        <label htmlFor="lastName">Last Name</label>
        <input
          type="text"
          id="lastName"
          value={lastName}
          onChange={(e) => setLastName(e.target.value)}
        ></input>
      </div>
      <div>
        <label htmlFor="email">Email</label>
        <input
          type="text"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        ></input>
      </div>
      <button type="submit">Create Contact</button>
    </form>
  );
};

export default ContactForm;
