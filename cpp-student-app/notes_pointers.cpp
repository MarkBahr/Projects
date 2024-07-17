/*
LINKED LIST

A linked list is a list wherein each item contains not jsut data, but 
also a pointer-alink-to the next item in teh list. Vectors are fast when 
adding new elements on the end of the vector with push_back(), but slow 
when inserting elements at the nth index. One way to make inserts faster is 
to use a pointer.

VECTORS V. LINKED LIST
Vector: stores items in contiguous memory locations (index). Supports quic access 
to the i'th element via v.at(i). Fast on push_backs, but slow on inserts or deletes
on large lists that require shifing elements.

Linked List: Stores each item anywhere in memory, whith each item pointint
to the next item in the list. 

POINTER
A pointer is avarialble that contains a memory address, rather than containing 
data like most variables. 
- SYNTAX: Appending * after a data type in a variable declaration declares a 
pointer variable, as in int* myPtr. A pointer variable indicates the type of 
data to which the address points. So, valid pointer variable declarations are 
int* myPtr1, char* myPtr2, double* myPtr3, and even Seat* myPtr4 (where Seat 
is a class type); all such variables will contain memory addresses. 
- SYNTAX: Prepending & to any variable's name gets the variable's address. & 
is the reference operator that returns a pointer to a variable: &variableName
- SYNTAX: Prepending * to a pointer variable's name in an expression gets the 
data to which the variabble points, as in *myPtr1, an act known as dereferencing
a pointer variable. * is the dereference operator tjat allows the program to 
access the value pointed to by the pointer using the form *variableName. 

So, how do you get the data to which a pointer variable points?
	Answer: You use the * before the variable name. 
*/

// POINTER EXAMPLE
#include <iostream>
using namespace std;

int main() {
    double vehicleMpg = 0.0;
    double* valPtr = nullptr;

    valPtr = &vehicleMpg;

    *valPtr = 29.6; // Assigns the number to a variable
                    // Pointed to by valPtr.

    vehicleMpg = 40; 

    cout << "Vehicle MPG = " << vehicleMpg << endl;
    cout << "Vehicle MPG = " << *valPtr << endl;

    return 0;
}

/* Output:
	Vehicle MPG = 40
	Vehicle MPG = 40
	
	However, if you comment out line 50 the (vehicleMpg = 40;)
	then you get Vehicle MPG = 29.6.
*/

/* The following console Application assigns numItems' address 
	to numItemsPtr and prints the value to which numItems Ptr points (99).
*/ 

#include <iostream>
using namespace std;

int main() {
    int* numItemsPtr = nullptr;
    int numItems = 99;

    numItemsPtr = &numItems;

    cout << "Items: " << numItems << endl;

    return 0;
}

/* I started learning about the keyword new with C++ on page
	in 9.3, but the program won't run. Re-read ch 8 on classes.
*/

// Here's the one that wouldn't work: 
#include <iostream>
using namespace std;

class SimpleItem {
public:
    void PrintNums();
    SimpleItem(int initVal = -1, int initVal2 = -1);
private:
    int num1;
    int num2;
};

SimpleItem::SimpleItem(int initVal1, int initVal2) {
    num1 = initVal1;
    num2 = initVal2;

    return;
}

void SimpleItem::PrintNums{
    cout << "num1: " << num1 << endl;
    cout << "num2: " << num2 << endl;

    return;
}

int main() {
    SimpleItem* myItemPtr1 = nullptr;
    SimpleItem* myItermPtr2 = nullptr;

    myItemPtr1 = new SimpleItem;
    (*myItermPter1).PrintNums();
    cout << endl;

    myItermPtr2 = new SimpleItem(8, 9);
    (*myItermPter2).PrintNums();

    return 0;
}


