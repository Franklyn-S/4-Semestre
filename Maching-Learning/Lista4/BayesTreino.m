function model = BayesTreino (x, y, parameters)
   classes = unique(y)
    for j = 1:size(classes,1)
        i = classes(j)
        model.cov(:,:,i) = cov(x(y == i, :))
        model.mean(:,:,i) = mean(x(y == i, :))
        model.prior(i) = sum(y==i) / size(y,1)
    end
  end