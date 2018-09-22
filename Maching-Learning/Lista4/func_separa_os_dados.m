function dados = func_separa_os_dados (x,y,prop)
    ind = randperm(size(x,1));
    x = x(ind,:);
    y = y(ind,:);
    n_treino = ceil(prop * size(x,1))
    dados.treino.x = x(1:n_treino,:);
    dados.treino.y = y(1:n_treino,:);
    
    dados.teste.x = x(n_treino+1:end,:);
    dados.teste.y = y(n_treino+1:end,:);
  end