// CLASSES & OBJECTS
/*
A variable of a class type is known as an object. an object involved data and functions.
Like an engineer building multiple bridges from a single blueprint,
a programmer can crete multiple objects from a single class definintion.

Member functions are listed after the keyword public, and data
member variables are declared after the keyword private.

SYNTAX for CLASSES
	class ClassName {
		public:
			// Public member functions
		private: 
			// private data members
	};

The programmer uses the scope resolution operator :: as in 
ClassName::FunctionName() to inform the compiler that a function 
is a member function of the indicated class.

A member function call uses the dot operator, for example

	objectName.Memberfunction();
	
	
*/

// Class and program example
#include <iostream>
#include <string>
using namespace std;

class Person {
public:
	void SetFirstName(string firstNameToSet); // Function & setter to set the variable. 
	string GetFirstName() const;   // Function & getter to get the private variable
private:
	string firstName;  // Declare private Variable
};

// 
void Person::SetFirstName(string firstNameToSet) {
	firstName = firstNameToSet; // Assign private variable a value

	return;
}

string Person::GetFirstName() const {
	return firstName;
}

int main() {
	string userName = "Bob";
	Person person1;

	person1.SetFirstName(userName);
	cout << "He is " << person1.GetFirstName();

	return 0;
}