#include <iostream>
#include <cmath>
#include <limits>
using namespace std;


int main(int argc, char const *argv[]){
	// Ax = b
	double m, s, maior, aux; //auxiliares
	int row, col, n, linha;
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
		maior = -numeric_limits<double>::max();//-infinito


		//pivotamento
		for (int l = k; l < n; l++){ //percorre as linhas
			if(abs(A[l][k]) > maior){
				maior = abs(A[l][k]);//pega o maior pivo
				linha = l; //acha a linha do maior pivô
			}
		}
		if(linha!=k){
			for (int t = k; t < n; t++){//percorre as colunas
				//troca as linhas  
				aux = A[linha][t];
				A[linha][t] = A[k][t];
				A[k][t] = aux;
			}
			aux = b[linha][0];
			b[linha][0] = b[k][0];
			b[k][0] = aux;
		}
		//end_pivotamento
		for (int i = k+1; i < n; i++){ //percorre as linhas
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
	for (int k = n-1; k >= 0; k--){//substituição retroativa
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