function s = sigma(x,z)
  sigma1 = 0.1;
  s = gaussianKernel(x,z,sigma1);
endfunction