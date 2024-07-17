/* 
 * File:   softwareStudent.cpp
 * Author: Bahr
 * 
 * Created on January 23, 2019, 10:38 AM
 */

#include "softwareStudent.h"
#include <iostream>
#include <cstdlib>

softwareStudent::softwareStudent(string studentId, string firstName, string lastName, string emailAddress, int age, int daysInCourse[], Degree degreeProgram)
:student(studentId, firstName, lastName, emailAddress, age, daysInCourse)
{
    degreeProgram = SOFTWARE;
}

// Getter for getDegreeProgram in part D3. 
Degree softwareStudent::getDegreeProgram() {
        return SOFTWARE;
    }
 
// Call the print method from the student class.    
void softwareStudent::print() {
    this->print(); // Calls the print function from the student class.
    cout << '\t' << "SOFTWARE" << "\n"; // Displays "SOFTWARE" with a tab separating it from the last table item.
}
    
softwareStudent::~softwareStudent() {
}