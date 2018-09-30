#include <iostream>
#include <vector>
#include <math.h>
using namespace std;

int pai(int i){
	return i/2;
}

int esq(int i){
	return 2*i;
}

int dir(int i){
	return (2*i)+1;
}


void maxHeapify(vector<int> &A, int i, int tamHeap){
	int e = esq(i);
	int d = dir(i);
	int maior;
	if (e <= tamHeap && A[e] > A[i]){
		maior = e;
	}else{
		maior = i;
	}
	if (d <= tamHeap && A[d] > A[maior]){
		maior = d;
	}
	if (maior != i){
		//troca A[i] with A[maior]
		int aux = A[i];
		A[i] = A[maior];
		A[maior] = aux;

		maxHeapify(A, maior, tamHeap);
	}
}

void buildMaxHeap(vector<int> &A, int tamHeap){
	for(int i = floor(A.size()/2); i>=1; i--){
		maxHeapify(A,i, tamHeap);
	}
}

void heapSort(vector<int> &A){
	int tamHeap = A.size()-1;
	buildMaxHeap(A, tamHeap);
	for(int i = tamHeap; i>=2; i--){
		//troca A[i] with A[maior]
		int aux = A[1];
		A[1] = A[i];
		A[i] = aux;

		tamHeap--;
		maxHeapify(A,1, tamHeap);
	}
}


int main(){

	//teste
	vector<int> A;
	//A.push_back(-1);
	A.push_back(5);
	A.push_back(2);
	A.push_back(4);
	A.push_back(6);
	A.push_back(1);
	A.push_back(3);

	cout << "Antes" << endl;
	for(int k = 0; k < A.size(); k++){
		cout << A[k] << " ";
	}
	cout << endl;

	heapSort(A);

	cout << "Depois" << endl;
	for(int k = 0; k < A.size(); k++){
		cout << A[k] << " ";
	}
	return 1;
}