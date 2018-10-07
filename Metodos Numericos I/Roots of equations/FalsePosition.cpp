#include <iostream>
#include <cmath>
using namespace std;



double f (double x) {
	return pow(x,3)-9*x+3;
}


double falsePosition (double (*f)(double), double a, double b, double e1, double e2, int maxInter) {

	if (b-a < e1) {
		return a;
	}

	int k = 0;
	double x;
	double fx; // função f aplicada a x
	double fa; // função f aplicada a a
	double fb; // função f aplicada a b

	//cabeçalho
	cout << "Iteração" << " | ";
	cout << "x" << " | ";
	cout << "f(x)" << " | ";
	cout << "b-a" << endl;

	while ((b-a) >= e1 && k < maxInter) {
		k++;

		fa = (*f)(a);
		fb = (*f)(b);

		if (abs(fa) < e2) {
			return a;
		}

		if (abs(fb) < e2) {
			return b;
		}


		x = ((a*fb) - (b*fa))/fb - fa;

		fx = (*f)(x);
		if (fx > 0) {
			a = x;
		} else {
			b = x;
		}	

		//prints
		cout << k << "        | ";
		cout << x << " | ";
		cout << fx << " | ";
		cout << b-a << endl;
	}
 
	return x;
}


int main() {
	double erro = 5 * pow(10,-4);
	double raiz = falsePosition(f, 0, 1, erro, erro, 20);
	cout << raiz << endl;
	return 0;
}