#include <iostream>
#include <cmath>
using namespace std;



double f (double x){
	return pow(x,3)-9*x+3;
}
double phi(double x){
	return pow(x,3)/9+0.33333333333;
}


double PontoFixo(double (*f)(double), double (*phi)(double), double x0, double e1, double e2, int maxInter){
	int k = 1;
	double fx0 = (*f)(x0);
	if(abs(fx0) < e1) {
		return x0;
	}
	double x1;
	double fx1;
	//cabeçalho
	cout.precision(4);
	cout << fixed;
	cout << "k" << " | ";
	cout << "   x  " << " | ";
	cout << "f(x)" << endl;
	

		while(k < maxInter){
			x1 = (*phi)(x0);
			fx1 = (*f)(x1);
			//prints
			cout << k << " | ";
			cout << x1 << " | ";
			cout << fx1 << endl;

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
	double raiz = PontoFixo(f, phi, 0.5, 5*pow(10,-4), 5*pow(10,-4), 20);
	cout << "Raiz: " << raiz << endl;
	return 0;
}