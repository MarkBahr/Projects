// NOTES ON CPP Arrays & Vectors

/*
VECTORS
Vector Declaration:
	vector<dataType> identifier(numElements);
	
	for example:
		vector<string> nameList(5);	// A string vector with 5 elements.

	Vectors are accessed using vector.at()
	
	// Assigning elements a value:
	
	nameList.at(0) = "Bobby";

*/

// Using vectors to find the Nth element in the list.

#include <iostream>
#include <vector>
using namespace std;

int main() {
    vector<int> oldestPeople(5);
    int nthPerson;      // For user input, Nth olders person

    oldestPeople.at(0) = 122;
    oldestPeople.at(1) = 199;
    oldestPeople.at(2) = 117;
    oldestPeople.at(3) = 117;
    oldestPeople.at(4) = 116;
    
    cout << "Enter N (1 thru 5): ";
    cin >> nthPerson;

    if ((nthPerson >= 1) && (nthPerson <= 5)) {
        cout << "The " << nthPerson << "th oldest persion lived ";
        cout << oldestPeople.at(nthPerson - 1) << " years." << endl;
    }

    return 0;
}

// Using push_back(), back(), and pop_back()

#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main() {
    vector<string> groceryList; // vector for storing shopping list
    string groceryItem;      // Individual grocery items
    string userCmd;         // User input

    // Promp user to populate shopping list
    cout << "Enter grocery items or type done." << endl;
    cin >> groceryItem;
    while (groceryItem != "done") {
        groceryList.push_back(groceryItem);
        cin >> groceryItem;
    }

    // Display shopping list
    cout << endl << "Enter any key for next item." << endl;
    while (groceryList.size() > 0) {
        groceryItem = groceryList.back();
        groceryList.pop_back();
        cout << groceryItem << "  ";
        cin >> userCmd;
    }
    cout << endl << "Done shopping." << endl;

    return 0;
}


/* ITERATING over VECTORS using FOR LOOP. 
// This application will let you enter as many names as you like, 
and then will print the names of all the students you entered in 
the console. If you enter none, 4 students are already entered.
*/
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main() {
    vector<string> nameList; // vector for storing student list
    string name;      // Individual student names

    // Add 4 students to the roster
	nameList.push_back("Jesse");
    nameList.push_back("Mark");
    nameList.push_back("Lydia");
    nameList.push_back("Melissa");
	
	// Promp user to populate roster with more students
    cout << "Enter student name or type done." << endl;
    cin >> name;
    while (name != "done") {
        nameList.push_back(name);
        cin >> name;
    }

    cout << "  " << endl;
	cout << "Students in Mr. Smith's class:" << endl;
    cout << "  " << endl;

    for (int i = 0; i < nameList.size(); i++) {
        cout << nameList.at(i) << endl;
    }
    
    return 0;
}

// ARRAYS
/* ARRAYS

Arrays are declared as int myList[10], and accessa as myList[i].
Arrays have simpler syntax, but using vectors rather than arrays is good practice.

Two dimensional arrays, declared as int myArray[2][3] represent a table of 
variables with R rows and C columns, so R*C elements total. Three dimensional
arrays are also possible. 

Rows ar listed first and columns second. Therefor, if we defined the array above

myArray[2][3], and added elements
	myArray[0][0] = 55;
	myArray[1][1] = 77;
	myArray[1][2] = 99;
	myArray[0][2] = 48;
	
Then, 99 would be in the 2nd row and 3rd column, as shown below
		| 55|  	| 48|
	Rows| 	| 77| 99|
*/

// TWO DIMENSIONAL ARRAY EXAMPLE
#include <iostream>
using namespace std;

int main() {
    int cityA = 0;
    int cityB = 0;
    int DrivingDistances[3][3] = {
        {0, 960, 2960},     // row 0
        {960, 0, 2011},     // row 1
        {2960, 2011, 1}      // row 2
    };
    
    cout << "0: Boston 1: CHicago 2: Los Angeles" << endl;

    cout << "Enter city pair (Ex 1 2) -- ";
    cin >> cityA;
    cin >> cityB;

    cout << "Distance: " << DrivingDistances[cityA][cityB];
    cout << " miles." << endl;

    return 0;
}

/*
Write a for loop to print all elements in courseGrades, following each element with a space
(including the last). Print forwards, then backwards. End each loop with a newline. Ex: If
courseGrades = {7, 9, 11, 10}, print:
7 9 11 10
10 11 9 7
*/

// My answer to the Challenge
#include <iostream>
using namespace std;

int main() {
    const int NUM_VALS = 4;
    int courseGrades[NUM_VALS];
    
    courseGrades[0] = 7;
    courseGrades[1] = 9;
    courseGrades[2] = 11;
    courseGrades[3] = 10;
    
    for (int i = 0; i < NUM_VALS; i++) {
        cout << courseGrades[i] << " ";
    }

    cout << " " << endl;

    for (int i = NUM_VALS - 1; i >= 0; i--) {
        cout << courseGrades[i] << " ";
    }

    return 0;
}








