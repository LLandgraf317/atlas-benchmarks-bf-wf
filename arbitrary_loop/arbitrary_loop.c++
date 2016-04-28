#include <iostream>
#include <climits>

using namespace std;

int main() {
	long a = 2L;
	long b = 2L;

	cout << LONG_MAX << endl;
	while(b < 100000) {
		b = a * 2 + b;
		cout << b << endl;
	}
	return 0;

}
