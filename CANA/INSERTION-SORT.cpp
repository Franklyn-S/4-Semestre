#include <iostream>
#include <vector>

using namespace std;

void InsertionSort(vector<int> &A){
	for (int j = 1; j < A.size(); j++){
		int key = A[j];
		int i = j-1;
		while((i >= 0) && (A[i] > key)){
			A[i+1] = A[i];
			int--;
		}
		A[i+1] = key;
	}
}

int main(){

	//teste
	vector<int> A;
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
	InsertionSort(A);
	cout << "Depois" << endl;
	for(int k = 0; k < A.size(); k++){
		cout << A[k] << " ";
	}

	return 0;
}

