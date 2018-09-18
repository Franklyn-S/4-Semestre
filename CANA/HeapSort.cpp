#include <iostream>
#include <vector>
#include <math.h>
using namespace std;
int tamHeap = 0;


int pai(int i){
	return i/2;
}

int esq(int i){
	return 2*i;
}

int dir(int i){
	return (2*i)+1;
}


void maxHeapify(vector<int> &A, int i){
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

		maxHeapify(A, maior);
	}
}

void buildMaxHeap(vector<int> &A){
	tamHeap = A.size();
	for(int i = floor(A.size()/2); i>=1; i--){
		maxHeapify(A,i);
	}
}

void heapSort(vector<int> &A){
	buildMaxHeap(A);
	for(int i = A.size(); i>=2;i--){
		//troca A[i] with A[maior]
		int aux = A[1];
		A[1] = A[i];
		A[i] = aux;

		tamHeap--;
		maxHeapify(A,1);
	}
}


int main(){

	//teste
	vector<int> A;
	A.push_back(-1);
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