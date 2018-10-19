load('ex5data1.data')
ex5data1;
%plot(ex5data1);
classes = 3;
n_centroides = 3;

centroides = ex5data1(1:n_centroides,1:4);
dist = zeros(n_centroides,150);%matriz de distancias

for i = 1:n_centroides
  for j = 1:150
    aux = norm((centroides(i,:) - ex5data1(j,1:4)));%euclidian distance
    dist(i,j) = aux; %matriz de distancias
  end
end

%falta atribuir os grupos e recalcular centroides