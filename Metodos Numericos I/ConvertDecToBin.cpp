#include <iostream>
#include <string>
#include <algorithm>
#include <vector>
using namespace std;


//Função que converte de decimal para binario
 vector<int> decToBin(int dec){
 	vector<int> v;
 	
 	while(dec != 0){
 		v.push_back(dec%2);
 		dec = dec>>1;
 	}
 	reverse(v.begin(),v.end());
 	return v;
}

int main(){
	int valor;
	cin >> valor;
	
	vector<int> invertedBin = decToBin(valor);

	for(int i = 0; i < invertedBin.size(); i++){
		cout << invertedBin[i];
	}
	cout << endl;
	
}