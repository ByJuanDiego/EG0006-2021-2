function [z,iter,e_rel] = potencia1(x0,A,tol,maxiter)

% Esta fución calcula el valor propio dominante y su correspondiente vector propio 
% por el método de la Potencia
% Entrada:
%   x0: iterado inicial.
%   A: matriz a la cual se le calculará el valor propio y vector propio
%      dominante
%   tol: tolerancia exigida para el criterio de parada (estimado del error relativo).
%   maxiter: número máximo de iteraciones a realizar. 

iter = 0;
x = x0;
e_rel = 100;  
z=[x0' 1];

while e_rel > tol & iter <= maxiter 
    
    y = A*x;
    [~,pos] = max(abs(y));
    
    c = y(pos);    % aproximación al valor propio
    x = (1/c)*y;   % aproximación al vector propio
    
    e_rel = norm((x-x0)/x,Inf);
    iter = iter+1;
    z=[z;x' c];
    x0 = x;
    
end

end
