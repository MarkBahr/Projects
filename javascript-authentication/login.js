function niceFunction() {
  alert("Create account functionality has not yet been set up.");
}

function marksFunction() {
  alert(
    "Contact page not yet set up. For now, you can contact us at OurCompany@email.com"
  );
}

var attempt = 3; // Variable to count number of attempts.
// Function below executes on click of login button.
function validate() {
  var username = document.getElementById("username").value;
  var password = document.getElementById("password").value;
  if (username == "YourUserName" && password == "YourPassword#123") {
    alert("You are logged in.");
    window.location =
      "https://gluconatekid.github.io/ProgrammingProjects/art.html"; // Redirecting to another page.
    return false;
  } else {
    attempt--; // Decrementing by one.
    alert(
      "Incorrect username or password. You have " + attempt + " attempts left;"
    ); // This tells the user how many attempts are left.
    //After the 3rd attempt, the text fields are disabled.
    if (attempt == 0) {
      document.getElementById("username").disabled = true;
      document.getElementById("password").disabled = true;
      document.getElementById("submit").disabled = true;
      return false;
    }
  }
}
