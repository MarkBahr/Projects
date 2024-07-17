/* 
 * File:   networkStudent.cpp
 * Author: Bahr
 * 
 * Created on January 23, 2019, 10:37 AM
 */

#include <iostream>
#include "networkStudent.h"
#include <cstdlib>

networkStudent::networkStudent(string studentId, string firstName, string lastName, string emailAddress, int age, int daysInCourse[], Degree degreeProgram)
:student(studentId, firstName, lastName, emailAddress, age, daysInCourse)
{
    degreeProgram = NETWORKING;
}

// Getter for getDegreeProgram in part D3. 
Degree networkStudent::getDegreeProgram() {
        return NETWORKING;
    }

// Call the print method from the student class.    
void networkStudent::print() {
    this->print(); // Calls the print function from the student class.
    cout << '\t' << "NETWORK" << "\n"; // Displays "NETWORK" with a tab separating it from the last item.
}

// Call destructor from student class.
networkStudent::~networkStudent() {
}