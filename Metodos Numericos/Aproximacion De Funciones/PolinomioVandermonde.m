function [P] = PolinomioVandermonde(x, y)

    %{ Retorna los coeficientes del polinomio interpolador
    %} en orden ascendente vía matriz de vandermonde
    
    M = fliplr(vander(x));
    fprintf("\nMatriz de Vandermonde:\n\n")
    
    disp(M);
    P = linsolve(M, y);
    
end
