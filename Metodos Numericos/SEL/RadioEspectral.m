function [bool, rho] = RadioEspectral(T)
    
    % Función que calcula el radio espectral (rho) de una matriz (T) e
    % indica si los métodos de Jacobi y Gauss-Seidel son convergentes o no.
    
    rho = max(abs(eig(T)));
    
    if rho < 1
        bool = true;
        fprintf("ρ(T) < 1, por lo que el método es convergente\n")
    else
        bool = false;
        fprintf("ρ(T) ≥ 1, por lo que el método no es convergente\n")
    end
    
end
