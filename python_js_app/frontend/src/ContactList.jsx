// This file is for the component that renders our contacts
// IMPORTS
import React from "react";

// New component, in the function takes a prop
// html includes table that will be dynamically rendered
const ContactList = ({ contacts, updateContact, updateCallback }) => {
  return (
    <div>
      <h2>Contacts</h2>
      <table>
        <thead>
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {contacts.map((contact) => (
            <tr key={contact.id}>
              <td>{contact.firstName}</td>
              <td>{contact.lastName}</td>
              <td>{contact.email}</td>
              <td>
                <button onClick={() => updateContact(contact)}>Update</button>
                <button>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

// We need to export the component ContactList (it needs to be exported for us to be able to import it)
export default ContactList;
