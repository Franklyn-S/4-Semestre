#include <iostream>
#include <cmath>
using namespace std;



double f (double x){
	return -(exp(x)/2) + 2*cos(x);
}


double Secant(double (*f)(double), double x0, double x1, double e1, double e2, int maxInter){
	int k = 1;
	double fx0 = (*f)(x0);
	double fx1 = (*f)(x1);
	double x2;
	double fx2;
	if(abs(fx0) < e1) {
		return x0;
	}
	if (abs(x1-x0) < e2 or abs(fx1) < e1 ){
		return x1;
	}

	//cabeçalho
	cout.precision(4);
	cout << fixed;
	cout << "k" << " | ";
	cout << "   x  " << " | ";
	cout << " f(x)  " << " | ";
	cout << "b-a" << endl;

	while(k < maxInter){
		x2 = (x0*fx1-x1*fx0)/(fx1-fx0);
		fx2 = (*f)(x2);
		cout << k << " | ";
		cout << x2 << " | ";
		if(fx2>0){
			cout << "+";
		}
		cout << fx2 << " | ";
		cout << x1-x0 << endl;
		if (abs(x2-x1) < e2 or abs(fx2) < e1 ){
			return x2;
		}
		x0 = x1;
		x1 = x2;
		fx0 = (*f)(x0);
		fx1 = (*f)(x1);
		//prints
	
		k++;
	}

	return x2;
}


int main()
{
	double raiz = Secant(f, 0, 1, pow(10,-4), pow(10,-4), 20);
	cout << "Raiz: " << raiz << endl;
	return 0;
}