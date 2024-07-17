/* 
 * File:   student.h
 * Author: Bahr
 *
 * Created on January 23, 2019, 10:37 AM
 */
#include <string>
#include "degree.h"
#ifndef STUDENT_H
#define	STUDENT_H
#include <iostream>
#include <string>
using namespace std;

class student {
    
public:
    student(); // Empty constructor.
    student(string id, string fName, string lName, string eAddress, int sAge, int daysInCourse[]); // constructor "student" part D2. Does not include degreeProgram (aka degreeType) since the subprograms do that.  
    const static int daysInCourseArray = 3;
    virtual void print(); // Virtual print in part D2.
    
    // Setters and getters from part D2.
    void SetStudentId(string id); 
    void SetFirstName(string firstName);
    void SetLastName(string lastName);
    void SetEmailAddress(string emailAddress);
    void SetStudentAge(int age);
    void SetNumDaysCourse(int daysInCourse[]);
    
    string GetStudentId();
    string GetFirstName();
    string GetLastName();
    string GetEmailAddress();
    int GetStudentAge();
    int GetNumDaysCourse();
    virtual Degree getDegreeProgram() = 0;// Virtual getDegreeProgram in part D2.
    
    virtual ~student(); // Destructor from part D2.

private:
    // Instance variables from part D1.
    string studentID; 
    string firstName;
    string lastName;
    string emailAddress;
    int age;
    int daysInCourse[daysInCourseArray]; // Days it took a student to take a course.
    Degree degProgram;   
};

#endif	/* STUDENT_H */


