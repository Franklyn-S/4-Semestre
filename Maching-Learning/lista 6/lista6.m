load('ex6data2.mat');
model = svmTrain(X, y, 1, @sigma, 1e-3, 20);

visualizeBoundary(X, y, model);
model.w;
