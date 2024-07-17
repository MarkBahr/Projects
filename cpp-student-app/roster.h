/* 
 * File:   roster.h
 * Author: Bahr
 *
 * Created on January 23, 2019, 10:38 AM
 */
#ifndef ROSTER_H
#define	ROSTER_H

#include "student.h"
// #include <cstdlib>
#include <iostream>
#include <string>

class roster {
public:
    roster(); // empty constructor creates empty roster.
    roster(int capacity);
    
    // Any variables in the student class, don't repeat them here.
    int i;
    int capacity;
    int formerIndex;
    bool present;
    student* classRosterArray[5]; // Creates my array of pointers in part E1
    student* getStudentAt(int index);
    void parseThenAdd(string record);
    void add(string studentID, string firstName, string lastName, string emailAddress, int age, int days1, int days2, int days3, Degree degProgram);
    void print();
    void printAll();
    bool remove(string studentId);
    void printAverageDaysInCourse(string studentId);
    void printInvalidEmails();
    void printByDegreeProgram(Degree d); //Prints students by degree.
    ~roster(); // This destructor destroys the roster.
};

#endif	/* ROSTER_H */