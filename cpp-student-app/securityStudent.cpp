/* 
 * File:   securityStudent.cpp
 * Author: Bahr
 * 
 * Created on January 23, 2019, 10:38 AM
 */

#include "securityStudent.h"
#include <iostream>
#include <cstdlib>

securityStudent::securityStudent(string studentId, string firstName, string lastName, string emailAddress, int age, int daysInCourse[], Degree degreeProgram)
:student(studentId, firstName, lastName, emailAddress, age, daysInCourse){
    degreeProgram = SECURITY;
}

// Getter for getDegreeProgram in part D3. 
Degree securityStudent::getDegreeProgram() {
        return SECURITY;
    }
  
// Call the print method from the student class.    
void securityStudent::print() {
    this->print();  // Calls the print function from the student class.
    cout << '\t' << "SECURITY" << "\n"; // Displays "SECURITY" with at tab separating it from the last item.
}

// Calls the destructor from the student class.
securityStudent::~securityStudent() {
}