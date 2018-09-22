function y_hat = BayesPredicao (x,model)
    for j=1:size(model.prior,1)
      prior = (1/(det(model.cov(:,:,j))^1/2) *(2*pi)^size(x,2))*exp(-1/2*(x - model.mean(:,:,j))'*(inv(model.cov(:,:,j)))*(x-model.mean(:,:,j)))
    end
end