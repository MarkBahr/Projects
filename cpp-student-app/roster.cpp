/* 
 * File:   roster.cpp
 * Author: Bahr
 * 
 * Created on January 23, 2019, 10:38 AM
 * Modified 7/19/2019
 */

#include <iostream>
#include <string>
#include "networkStudent.h"
#include "softwareStudent.h"
#include "securityStudent.h"
#include "roster.h"

// Empty constructor gets set to default values.
roster::roster() {
    this->capacity = 0;
    this->formerIndex = -1;
    this->classRosterArray[] = nullptr;
}

roster::roster(int capacity) {
    this->capacity = capacity;
    this->formerIndex = -1;
    this->classRosterArray[] = new student*[capacity];
}

student * roster::getStudentAt(int index) {
    return classRosterArray[index];
}

// Parsing Data. Finds the strings using commas to parse the data in the studentData table.
void roster::parseThenAdd(std::string record) {
     
    if (formerIndex < capacity) {
        ++formerIndex; 
       
       //read ID        
       int rhs = record.find(",");
       string studentID = record.substr(0, rhs);
       
       // Read first name
       int lhs = rhs + 1;
       rhs = record.find(",", lhs);
       string firstName = record.substr(lhs, rhs - lhs);
       
       // Read last name
       int lhs = rhs + 1;
       rhs = record.find(",", lhs);
       string lastName = record.substr(lhs, rhs - lhs);
       
       // Read e-mail
       int lhs = rhs + 1;
       rhs = record.find(",", lhs);
       string emailAddress = record.substr(lhs, rhs - lhs);
       
       // Read age
       int lhs = rhs + 1;
       rhs = record.find(",", lhs);
       int age = record.substr(lhs, rhs - lhs);
       
       // Read first days for first course
       int lhs = rhs + 1;
       rhs = record.find(",", lhs);
       int days1 = record.substr(lhs, rhs - lhs);
       
       // Read first days for second course
       int lhs = rhs + 1;
       rhs = record.find(",", lhs);
       int days2 = record.substr(lhs, rhs - lhs);
       
       // Read first days for third course
       int lhs = rhs + 1;
       rhs = record.find(",", lhs);
       int days3 = record.substr(lhs, rhs - lhs);
       
       //Read degree type
       Degree lhs = rhs + 1;
       rhs = record.find(",", lhs);
       Degree degProgram = record.substr(lhs, rhs = lhs);
       
       // add() method
       add(studentID, firstName, lastName, emailAddress, age, days1, days2, days3, degProgram);
   }
}
   
void roster::add(string studentID, string firstName, string lastName, string emailAddress, int age, int days1, int days2, int days3, Degree degProgram){
            
    // Array to get the days for each course.
    int daysInCourse[3];
       daysInCourse[0] = days1;
       daysInCourse[1] = days2;
       daysInCourse[2] = days3;
       
       // Tells which student type to use in the classRosterArray.
       if (degProgram == NETWORK) classRosterArray[formerIndex] = new networkStudent(studentID, firstName, lastName, emailAddress, age, daysInCourse, degProgram);
       else if (degProgram == SECURITY) classRosterArray[formerIndex] = new securityStudent(studentID, firstName, lastName, emailAddress, age, daysInCourse, degProgram);
       else classRosterArray[formerIndex] = new softwareStudent(studentID, firstName, lastName, emailAddress, age, daysInCourse, degProgram);
}

void roster::printAll(){
    for (int i =0; i <= formerIndex; ++i) {
        this->classRosterArray[i]->print(); // Calls the print function from a subclass. It chooses the correct subclass by using run-time polymorphism.
    }
}

// Remove function defined. Requirement E3b.
bool roster::remove(string id) {
    bool present = false;  
    for (int i = 0; i <= formerIndex; ++i) {
        if (this->classRosterArray[i]->GetStudentId() == id) {
            present = true;
            // Delete student from roster. Perhaps the student moved??
            delete this->classRosterArray[i];
            // Move current students up in position.
            this->classRosterArray[i] = this->classRosterArray[formerIndex];
            --formerIndex; // Student roster has one less student.
        }
    }
    return present;
}

void roster::printAverageDaysInCourse(string studentId) {
    bool present = false;
    for (int i = 0; i <= formerIndex; ++i) {
        if  (this->classRosterArray[i]->GetStudentId() == studentId {
            present = true;
            daysInCourse[] = this->classRosterArray[i]->GetNumDaysCourse();
            cout << "Average days that student " << studentId << " takes to complete a course: " << (daysInCourse[0] + daysInCourse[1] + daysInCourse[2]) / 3 << endl;
        }         
    }
}

void roster::printByDegreeProgram(Degree d) {
    cout << "Printing students whose degree is " << degreeProgramStrings[d] << "\n";
    for (int i = 0; i <= formerIndex; ++i) {
        if (this->classRosterArray[i]->getDegreeProgram() == d) this->classRosterArray[i]->print();
    }    
}

 void roster::printInvalidEmails() {
    cout << "Anyone who entered an invalid e-mail will be named mud!\n";
    for (int i = 0; i <= 5; i++) {
        string invalidEmail = this->classRosterArray[i]->GetEmailAddress();
        if (invalidEmail.find('@') == string::npos) {
            cout << "invalid email" << invalidEmail << endl;
        }
        if (invalidEmail.find('.') == string::npos) {
            cout << "invalid email" << invalidEmail << endl;
        }
        if (invalidEmail.find(' ') != string::npos) {
            cout << "invalid email" << invalidEmail << endl;
        }      
    }
}

roster::~roster() {
}

void main() {
    cout << "Scripting & Programming Applications - C867" << '\n';
    cout << "This application was made using C++" << '\n';
    cout << "Student ID: 000366323" << '\n';
    cout << "Mark Bahr" << '\n';
    
    // This is the exact data from the performance assessment rubric.
    string studentData[5] =
    {
        "A1,John,Smith,John1989@gm ail.com,20,30,35,40,SECURITY",
        "A2,Suzan,Erickson,Erickson_1990@gmailcom,19,50,30,40,NETWORK",
        "A3,Jack,Napoli,The_lawyer99yahoo.com,19,20,40,33,SOFTWARE",
        "A4,Erin,Black,Erin.black@comcast.net,22,50,58,40,SECURITY",
        "A5,Mark,Bahr,mbahr2@my.wgu.edu,34,24,15,35,SOFTWARE"
    }
    
    roster* vip = new roster(5); // This makes the roster list.
        
    cout << "Loading: adding your favorite students:\n";
    for (int i = 0; i < 5; ++i) {
        vip->parseThenAdd(vip->studentData[i]); // Parses records and turns them into students, and then adds it to the roster. 
    }
    
    cout << "Dear professor, you should see all your students on the attendance roll."
    vip->printAll();
    cout << endl;
    
    // Let's try the average days it takes each student to complete a course. Meets requirement E3d.
    cout << "Students, rev up your race car engines! Let's see who finishes their courses the fastest:\n";
    for (int i = 0; i < 5; ++i) {
        vip->printAverageDaysInCourse(vip->getStudentAt(i)->(student::GetStudentId()));
    }
    cout << "Hooray for the winner. Woo hoo!\n";   
    
    // Check for invalid e-mail addresses. Meets requirement 3De.
    cout << "Which e-mails, if any, were entered incorrectly?" << endl;
               
    vip->printInvalidEmails();
    cout << "Finished printing invalid e-mails.";
      
    // Lets see if we can print only the students in the software program. 
    for (int i = 0; i <= 2; ++i) {
        vip->printByDegreeProgram((Degree) i) {
    }
            
    // Removing a student who withdrew from the university. (Part E3b)
    cout << "Removing A3: \n"; 
    if (vip->remove("A3")) {
        vip->printAll();        
    }
    else cout << "Student with this ID no longer attends this college!" << endl;
    
    // Let's check to see if that student was removed.
    cout << "Try to remove A3 again: \n";
    if (vip->remove("A3")) {
        vip->printAll();
    }
    else cout << "Student with this ID no longer attends this college!" << endl;
     // The above line should print a message saying such a student with this ID was not found.
    }
    
return 0;
}