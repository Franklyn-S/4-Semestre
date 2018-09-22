#Importar dados
data=load('ex1data2.txt');

#a vari�vel da coluna 3 ser� estimada a partir das vari�veis das coluna 1 e 2
x = data (:,1:2); 
y = data (:,3);

#plot(x,y, �*�);

###Regressao multivariada


#Numero de colunas
[n m] = size(x);

#Adicionando intercepto
x = [ones(n,1) x];


w = zeros(m+1,1);

#Passo de aprendizagem
alpha = 0.01;

#Quantidade de itera��es do aprendizado
nEpocas = 100;

#Erros quadraticos m�dios
eqm = [];

###Gradiente descendente estoc�stico
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
   w = w + (alpha*erro*x(j,:))';
   endfor
   eqm = [eqm erro_total/n];
endfor

#plot(1:nEpocas, eqm)


#3 quest�o a partir daqui
lambda = 3
I = eye(m+1,m)
I(1,1) = 0
w = pinv(x'*x)*x'*y +  lambda*I

