/* 
 * File:   student.cpp
 * Author: Bahr
 * 
 * Created on January 23, 2019, 10:37 AM
 */

#include "student.h"
#include <iostream>
#include <string>
#include <cstdlib>
using std::cout;
using std::left;
using std::setw;

// Empty constructor takes these default values.
student::student() { 
    studentID = "";
    firstName = "";
    lastName = "";
    emailAddress = "";
    age = "";
    for (int i = 0; i < daysInCourseArray; ++i) this->daysInCourse[i] = 0;            
}

// Defining the student constructor from part D2 with instance variables from part D1.
student::student(string id, string fName, string lName, string eAddress, int sAge, int daysInCourse[])
{
    studentID = id;
    firstName = fName;
    lastName = lName;
    emailAddress = eAddress;
    age = sAge;
    for (int i = 0; i < daysInCourseArray; ++i) this->daysInCourse[i] = daysInCourse[i];
}

// Setters for part D2.
    void student::SetStudentId(string id){
        studentID = id;
    }
    void student::SetFirstName(string fName){
        firstName = fName;
    }
    void student::SetLastName(string lName){
        lastName = lName;
    }
    
    void student::SetEmailAddress(string eAddress){
        emailAddress = eAddress;
    }
    
    void student::SetStudentAge(int sAge) {
        age = sAge;
    }
    
    void student::SetNumDaysCourse(int daysInCourse[]){
        for (int i = 0; i < daysInCourseArray; ++i)
            this->daysInCourse[i] = daysInCourse;
    }
    
    // Getters for part D2.
    string student::GetStudentId() {
        return studentID;
    }
    
    string student::GetFirstName() {
        return firstName;
    }
    
    string student::GetLastName() {
        return lastName;
    }
    
    string * student::GetEmailAddress() {
        return emailAddress;
    }
    
    int student::GetStudentAge() {
        return age;
    }
    
    int student::GetNumDaysCourse() {
        return daysInCourse;
    }
       
    void student::print() {
        cout << studentID << '\t' << firstName << '\t' << lastName << '\t' << emailAddress << '\t' << age << '\t' << daysInCourse[0] << '\t' << daysInCourse[1] << '\t' << daysInCourse[2];
    }
        
    student::~student() {
    }