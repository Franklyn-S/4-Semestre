#include <iostream>

using namespace std;


int ParentesesEncaixados(int bin){
	if (bin <= 1){
		return bin;
	}else{
		return 2*ParentesesEncaixados(bin/10) + bin%10;
	}
}
int main(){
	int bin = 111001;
	int teste = ParentesesEncaixados(bin);
	cout << teste << endl;
}