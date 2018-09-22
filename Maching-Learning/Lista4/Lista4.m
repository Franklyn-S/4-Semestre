clear clc
load('DadosLista4.mat');

dados = func_separa_os_dados(Dados,y,.8);



model = BayesTreino(dados.treino.x, dados.treino.y);


MatrizDeConfusao = zeros(3,3);


MatrizDeConfusao()