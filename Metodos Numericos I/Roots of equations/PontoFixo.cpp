#include <iostream>
#include <cmath>
using namespace std;



double f (double x){
	return pow(x,3)-9*x+3;
}


double PontoFixo(double a, double b, float e1, float e2, int maxInter){

	int k = 1;
	double fa = f(a);
	double x;
	double fx;

	//cabeçalho
	cout << "Iteração" << " | ";
	cout << "x" << " | ";
	cout << "f(x)" << " | ";
	cout << "b-a" << endl;

	while(k < maxInter){
		x = (a*f(b)-b*f(a))/f(b)-f(a);
		fx = f(x);
		if(fx > 0){
			a = x;
		}else{
			b = x;
		}

		if (b-a < e1){
			return x;
		}
		else if(abs(f(a)) < e2){
			return a;		
		}
		else if(abs(f(b)) < e2){
			return b;
		}

		//prints
		cout << k << " | ";
		cout << x << " | ";
		cout << fx << " | ";
		cout << b-a << endl;
		k++;
	}

	return x;
}


int main()
{
	double raiz = PontoFixo(0,1,5*pow(10,-4), 5*pow(10,-4),20);
	cout << raiz << endl;
	return 0;
}