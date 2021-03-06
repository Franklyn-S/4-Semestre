#include <iostream>
#include <cmath>
using namespace std;



double f (double x){
	return -(exp(x)/2) + 2*cos(x);
}
double fLine(double x){
	return -(exp(x)/2) -2*sin(x);
}

double phi(double x){
	return x-(f(x)/fLine(x));
}


double NewtonRapson(double (*f)(double), double (*phi)(double), double x0, double e1, double e2, int maxInter){
	double fx0 = (*f)(x0);
	if(abs(fx0) < e1) {
		return x0;
	}
	int k = 1;
	double x1;
	double fx1;
	//cabeçalho
	cout.precision(4);
	cout << fixed;
	cout << "k" << " | ";
	cout << "   x  " << " | ";
	cout << "f(x)  " << "  | ";
	cout << "f'(x)" << endl;

	cout << 0 << " | ";
	cout << x0 << " | ";
	cout << fx0 << "  | ";
	cout << fLine(x0) <<endl;

	while(k < maxInter){
		x1 = (*phi)(x0);
		fx1 = (*f)(x1);
		//prints
		cout << k << " | ";
		cout << x1 << " | ";
		cout << fx1 << " | ";
		cout << fLine(x1) <<endl;

		if (abs(x1-x0) < e2 or abs(fx1) < e1 ){
			return x1;
		}

		x0 = x1;
		k++;
	}

	return x1;
}


int main()
{
	double raiz = NewtonRapson(f, phi, 0.5, 5*pow(10,-4), 5*pow(10,-4), 20);
	cout << "Raiz: " << raiz << endl;
	return 0;
}