function [P] = PolinomioNewton(x, y, n)
    
    % Retorna los coeficientes del polinomio interpolador de Newton
    % en orden descendente
    
    n = n + 1;
    M = DiferenciasDivididas(x,y);
    b = M(1, 2:end);
    P = b(1);
    
    for k=2:n
        
        P = [0 P] + b(k) * poly(x(1:k-1));
        
    end
    
end


