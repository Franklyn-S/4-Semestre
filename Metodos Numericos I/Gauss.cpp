#include <iostream>
using namespace std;


int main(int argc, char const *argv[]){
	// Ax = b
	double m, s; //aux
	int row = 3;
	int col = 3;
	double A[row][col] = {
		{20, 7, 9},
		{7, 30, 8},
		{9, 8, 30}
	};
	double x[row][1]; //vetor resposta x
	double b[row][1] = {
		{16}, 
		{38}, 
		{38}
	};
	int n = row-1;

	//Eliminação
	for (int k = 0; k < n-1; k++){
		for (int i = k+1; i < n; i++){
			m = A[i][k]/A[k][k];
			A[i][k] = 0;
			for (int j = k+1; j < n; j++){
				A[i][j] = A[i][j] - m*A[k][j];
				cout << A[k][j] << endl;
			}	
			b[i][0] = b[i][0] - m*b[k][0];
		}
	}
	//resolução do sistema
	
	x[n][0] = b[n][0]/A[n][n];
	for (int k = n-1; k >= 0; k++){
		s = 0;
		for (int j = k+1; j < n; j++){
			s = s + A[k][j]*x[j][0];
		}
		x[k][0] = (b[k][0]-s)/A[k][k];
	}
	//imprimir x
	for (int i = 0; i < n; i++){
		cout << x[i][0] << endl;
	}
	return 0;
}