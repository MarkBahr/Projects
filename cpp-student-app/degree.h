/* 
 * File:   degree.h
 * Author: Bahr
 *
 * Created on January 23, 2019, 10:29 AM
 */

#include <string>
#ifndef DEGREE_H
#define	DEGREE_H

// This is the enumerated data type required by part C.
enum Degree {SECURITY, NETWORKING, SOFTWARE};

//for labels. 
static const std::string degreeProgramStrings[] = {"SECURITY", "NETWORKING", "SOFTWARE"};

// Use degreeProgramStrings[SECURITY] to yield the string "SECURITY".
 
#endif	/* DEGREE_H */