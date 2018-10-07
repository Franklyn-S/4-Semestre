#include <iostream>

using namespace std;


int particao(int A[], int p, int r){
	int x = A[r];
	int i = p-1;
	for (int j=p; j <= r-1 ;j++){
		if (A[j] <= x){
			i++;
			//troca
			int aux = A[i];
			A[i] = A[j];
			A[j] = aux;
		}
	}
	int aux2 = A[i+1];
	A[i+1] = A[r];
	A[r] = aux2;
	return i+1;
}

void QuickSort(int A[], int p, int r){
	if(p<r){
		int q = particao(A,p,r);
		QuickSort(A,p,q-1);
		QuickSort(A,q+1,r);
	}
}

int main(){
	int A[6] = {5,4,3,2,1,0};
	QuickSort(A,0,5);
	for (int i = 0; i < 6; i++){
		cout << A[i];
	}
	cout << endl;

	return 1;
}