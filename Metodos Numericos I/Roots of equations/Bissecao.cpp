#include <iostream>
#include <cmath>
using namespace std;



double f (double x){
	return pow(x,3)-9*x+3;
}


double bissecao(double a, double b, float e, int maxInter){
	if (b-a < e){
		return a;
	}
	int k = 0;
	double M;
	double x;
	double fx;

	//cabeçalho
	cout << "Iteração" << " | ";
	cout << "x" << " | ";
	cout << "f(x)" << " | ";
	cout << "b-a" << endl;

	while((b-a) >= e && k < maxInter){
		k++;
		
		
		x = (a+b)/2;
		fx = f(x);
		if(fx > 0){
			a = x;
		}else{
			b = x;
		}

		//prints
		cout << k << " | ";
		cout << x << " | ";
		cout << fx << " | ";
		cout << b-a << endl;
	}

	return x;
}


int main()
{
	double raiz = bissecao(0,1,pow(10,-3), 20);
	cout << raiz << endl;
	return 0;
}