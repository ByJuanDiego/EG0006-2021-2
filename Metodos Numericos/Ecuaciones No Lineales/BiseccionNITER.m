function [k, n] = BiseccionNITER(a, b, tol)

n = log((b-a)/(2*tol))/log(2);
k = ceil(n);

end
