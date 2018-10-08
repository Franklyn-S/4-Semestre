#include<iostream>
#include<cmath>
using namespace std;


double NewtonPolinomios(int n, int a[4], double x, double e1, double e2, int iterMax){
	double deltaX = x;
	double b,c;
	for(int k = 0; k <= iterMax; k++){
		b = a[n-1];
		c = b;
		for (int i = n-1; i >= 1; i--){
			b = a[i] + b*x;
			c = b + c*x;
		}
		b = a[0] + b*x;
		if(abs(b) < e1){
			return x;
		}
		deltaX = b/c;
		x = x-deltaX;
		if(abs(deltaX) < e2){
			return x;
		}
	}
	cout << "Erro: algoritmo não convergiu após " << iterMax << " iterações.";
	return x;
}

int main(){
	int p[] = {1, 0, -9, 3};//polinomio
	cout << p[0];
	double raiz = NewtonPolinomios(4, p, 0.5, pow(10,-4), pow(10,-4), 20);
	cout << "Raiz: " << raiz;
	return 0;
}