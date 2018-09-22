#Importar dados
data=load('ex1data1.txt');

x = data (:,1); #em python usa “x = data [:,1]”
y = data (:,2);

###Regressao univariada


#Passo de aprendizagem
alpha = 0.001;

#Numero de colunas
n = size(x,1);

#Adicionando intercepto
x = [ones(n,1) x];

#Pesos iniciais é uma matriz 2 por 1 de zeros
w = zeros(2,1);
#plot(x,y, “*”);

#Erros quadraticos médios
eqm = [];

#Quantidade de iterações do aprendizado
nEpocas = 1000;



###Gradiente descendente estocástico
for i=1:nEpocas
  ind =  randperm(n);
  x = x(ind,:);
  y = y(ind);
  erro_total = 0;
  for j=1:n
    y_barra = x(j,:)*w;
    erro = y(j) - y_barra;
    erro_total = erro_total + erro*erro;
    
    #Atualizando os pesos de acordo com o erros
    w(1) =  w(1) + alpha*erro;
    w(2) =  w(2) + alpha*erro*x(j,2);
   endfor
   eqm = [eqm erro_total/n];
endfor

plot(1:nEpocas, eqm)

