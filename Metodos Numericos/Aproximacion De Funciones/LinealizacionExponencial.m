function [A, B] = LinealizacionExponencial(x, y)
    
    % Función que calcula los coeficientes (A) y (B)
    % de un ajuste exponencial tal que
    % y = A*e^(B*x)
    % 
    % Linealizando la función:
    % ln(y) = ln(A) + B*x
    %      ↓
    % ln(y) = C, ln(A) = D
    % 
    % C = B*x + D
    
    [n, ~] = size(x);
    
    M = [ones(n, 1) x];
    C = log(y);
    
    % Sistema de ecuaciones lineales de la forma
    % M*E = C
    
    [E] = M\C;
    
    D = E(1);
    B = E(2);
    
    A = exp(D);
    
end

