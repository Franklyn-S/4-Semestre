#Importar dados
data=load('ex2data1.txt');

#a variável da coluna 3 será estimada a partir das variáveis das coluna 1 e 2
x = data (:,1:2); 
y = data (:,3);


#figura com os dados
#plot(x, "*");

% Treino
idx = randperm(100);

x = x(idx,:);
x = y(idx);

xtr = x(1:70,:) 
ytr = y(1:70);

% Teste
xte = x(71:100,:);
yte = y(71:100);

#normalizacao
x = x/20;

#plot(x, "*");

#numero de colunas
[n m] = size(x)

#intercepto
x = [ones(n,1) x];

#pesos
w = zeros(m+1,1);

#Passo de aprendizagem
alpha = 0.01;

#Quantidade de iterações do aprendizado
nEpocas = 1000;

#erro quadratico medio
eqm = [];

###Gradiente descendente estocástico
for i=1:nEpocas
  ind = randperm(n)
  x = x(ind, :);
  y = y(ind);
  erro_total = 0;
  for j=1:n
    #modelo regressao logistica
    y_barra = 1/(1+exp(-w'*x(j,:)')); 
    erro = y(j) - y_barra;
    erro_total = erro_total + erro*erro;
    #Atualizando os pesos de acordo com o erros
    w = w + (alpha*erro*x(j,:))'; 
  endfor
  eqm = [eqm erro_total/n];
endfor
    
plot(1:nEpocas, eqm)
  
  



