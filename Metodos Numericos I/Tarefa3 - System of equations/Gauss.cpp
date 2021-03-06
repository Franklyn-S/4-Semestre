#include <iostream>
using namespace std;


int main(int argc, char const *argv[]){
	// Ax = b
	double m, s; //aux
	int row, col, n;
	row = 3;
	col = 3;
	n = 3;
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
	

	//Eliminação
	for (int k = 0; k < n-1; k++){//percorre as colunas
		for (int i = k+1; i < n; i++){ //percorr as linhas
			m = A[i][k]/A[k][k];
			A[i][k] = 0;
			for (int j = k+1; j < n; j++){//percorre as linhas calculando seus novos valores
				A[i][j] = A[i][j] - m*A[k][j];
			}
			b[i][0] = b[i][0] - m*b[k][0];
		}
	}

	//resolução do sistema
	
	x[n][0] = b[n][0]/A[n][n];
	for (int k = n-1; k >= 0; k--){
		s = 0;
		for (int j = k+1; j < n; j++){
			s = s + A[k][j]*x[j][0];
		}
		x[k][0] = (b[k][0]-s)/A[k][k];
	}
	//imprimir x
	cout << "Vetor resposta:" << endl;
	for (int i = 0; i < n; i++){
		cout << x[i][0] << endl;
	}
	return 0;
}