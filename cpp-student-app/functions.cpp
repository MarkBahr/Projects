// FUNCTIONS IN C++

/*
SYNTAX for function in c++

void FuncName(parameters) {
	// do this
	return;
}

*/

#include <iostream>
using namespace std;

void PrintTicTactoe(char horizChar, char vertChar) {
	
	cout << "X" << vertChar << "X" << vertChar << "X" endl;
	cout << horizChar << horizChar << horizChar << horizChar << horizChar << endl;
	cout << "X" << vertChar << "X" << vertChar << "X" endl;
	cout << horizChar << horizChar << horizChar << horizChar << horizChar << endl;
	cout << "X" << vertChar << "X" << vertChar << "X" endl;
	
	return;
}

int main() {
	PrintTicTactoe('~', '!');
	
	return 0;
}

/* 
	The return type of void above indicates taht the function does 
	not return any value, which is why it just says: return;
	
	A return statement may appear as any statement in a function, 
	not just as the last statement. Also, multiple return statements
	may exist in a function.

	The return type of the following function is double
*/

// This function converts height from ft & inches to centimeters.
#include <iostream>
using namespace std;

// Converts a height in feet/inches to centimeters.
double ToCentimeters(int heightFt, int heightIn) {

	const double CM_PER_IN = 2.54;
	const int IN_PER_FT = 12;
	int totIn = 0;
	double cmVal = 0.0;

	totIn = (heightFt * IN_PER_FT) + heightIn;
	cmVal = totIn * CM_PER_IN;
	return cmVal;
}

int main() {
	int userFt = 0;	// User defined
	int userIn = 0; // Usser defined

	// Prompuser for feet/inches
	cout << "Enter feet: ";
	cin >> userFt;

	cout << "Enter inches: ";
	cin >> userIn;

	// Output converted feet/inches to cm result
	cout << "Centimeteres: ";
	cout << ToCentimeters(userFt, userIn) << endl;

	return 0;
}

/*
A function's statements may include function calls, known as
nested function calls. 

Why do we use functions? 
	Answer:
	1. To improve program readability. 
	2. Modular program development. 
	3. To avoid writing redundant code.
	
*/