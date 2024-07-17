/* 
 * File:   networkStudent.h
 * Author: Bahr
 *
 * Created on January 23, 2019, 10:37 AM
 */

#include "student.h"
#ifndef NETWORKSTUDENT_H
#define	NETWORKSTUDENT_H

// This is a type of student, which inherits attributes from the student class.
class networkStudent : public student {
public:
       
    // Create constructor for networkStudent for part D3.
    networkStudent(
            string studentId, 
            string firstName, 
            string lastName, 
            string emailAddress, 
            int age, 
            int daysInCourse[], 
            Degree degreeProgram
    ); 
    
    Degree getDegreeProgram(); // Overrides getDegreeProgram from student.h. 
    void print(); // Print here overrides virtual print from student.h. 
    
    ~networkStudent(); // Destructor.
};

#endif	/* NETWORKSTUDENT_H */
