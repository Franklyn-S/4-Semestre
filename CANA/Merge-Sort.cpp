#include <iostream>
#include <vector>

using namespace std;

void merge(int A[], int p, int q, int r, int vetAux[]){
	int left = p;
	int right =  q;

	for(int i = p;i < r;++i){
		if((left < q) and ((right >= r) or(A[left]<A[right]))){
			vetAux[i] = A[left];
			++left;
		}else{
			vetAux[i]=A[right];
			++right;
		}
	}
	for(int j = p;j < r; ++j){
		A[j] = vetAux[j];
	}
}

void mergeSort(int A[], int p, int r, int vetAux[]){
	if (!((r-p) <2)) {
		int q = ((p+r)/2);
		mergeSort(A,p,q,vetAux);
		mergeSort(A,q,r,vetAux);
		merge(A,p,q,r,vetAux);
	}
}

void mergeSort(int A[], int p, int r){
	int vetAux[r];
	mergeSort(A,p,r,vetAux);
}

int main(){
	int A[6];
	int indice = 0;
	for(int t = 5;t>=0;t--){
		A[indice] = t;
		indice++;
	}
	cout << "Antes" << endl;
	for(int k = 0; k < 6; k++){
		cout << A[k] << " ";
	}
	cout << endl;
	mergeSort(A, 0, 6);
	cout << "Depois" << endl;
	for(int k = 0; k < 6; k++){
		cout << A[k] << " ";
	}
	cout << endl;
	return 0;
}