#include <iostream>

using namespace std;


int ConvertBinToDec(int bin){
	int pot = 1;
	int valorDec = 0;
	while(bin > 0){
		valorDec += bin%10 * pot;
		bin = bin/10;
		pot *= 2;
	}
	return valorDec;
}
int main(){
	int bin = 111001;
	int teste = ConvertBinToDec(bin);
	cout << teste << endl;
}