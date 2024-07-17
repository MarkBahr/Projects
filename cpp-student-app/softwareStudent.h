/* 
 * File:   softwareStudent.h
 * Author: Bahr
 *
 * Created on January 23, 2019, 10:38 AM
 */
#ifndef SOFTWARESTUDENT_H
#define	SOFTWARESTUDENT_H

#include "student.h"

class softwareStudent : public student {
public:
    softwareStudent(
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
    
    ~softwareStudent();    

#endif	/* SOFTWARESTUDENT_H */