/* 
 * File:   securityStudent.h
 * Author: Bahr
 *
 * Created on January 23, 2019, 10:38 AM
 */

#include "student.h"
#ifndef SECURITYSTUDENT_H
#define	SECURITYSTUDENT_H

class securityStudent : public student {
public:
    securityStudent(
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
    
    ~securityStudent();

#endif	/* SECURITYSTUDENT_H */
