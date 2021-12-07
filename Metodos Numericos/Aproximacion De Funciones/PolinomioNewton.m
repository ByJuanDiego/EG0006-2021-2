function [P] = PolinomioNewton(x, y)

    % Retorna los coeficientes del polinomio interpolador de Newton
    % en orden descendente
    
    M = DiferenciasDivididasNewton(x,y);
    n = length(x);
    b = M(1,2:end);
    P = b(1);
    
    fprintf("\nTérmino i=0 de la sumatoria\n\n")
    fprintf("b(0) = %f\n", b(1));
    
    for k=2:n
        
        P = [0 P] + b(k) * poly(x(1:k-1));
        
        fprintf("\n\nTérmino i=%d de la sumatoria\n\n\n", k-1)
        fprintf("b(%d) = %f\n", k-1, b(k));
        
        fprintf("\nLos xi a multiplicar Π(x-xi):\n")
        disp(vpa(x(1:k-1)', 5))
        
        fprintf("\nLa productoria desarrollada como polinomio:\n")
        disp(vpa(poly2sym(poly(x(1:k-1))), 5));
        
        fprintf("\nEl polinomio multiplicado por b(%d):\n", k-1);
        disp(vpa(poly2sym(b(k) * poly(x(1:k-1))), 5));
        
    end
    
end

