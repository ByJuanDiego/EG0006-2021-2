function [g, A, B] = LinealizacionExponencial(x, y)
    
    % 
    % y = A*exp(B*x)
    % ln(y) = ln(A) + B*x
    % 
    % ln(y) = C, ln(A) = D
    % 
    % C = B*x + D
    
    [n, ~] = size(x);
    
    M = [ones(n, 1) x];
    C = log(y);
    
    % Sistema de ecuaciones lineales de la forma
    % M*E = C
    
    [E] = linsolve(M, C);
    D = E(1);
    A = exp(D);
    B = E(2);
    
    g = @(x) (A.*exp(B.*x)); 
    
end

