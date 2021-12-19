function [bool] = MatrizDominante(A)
    
    % Función que verifica si una matriz (A) es estrictamente dominante.
    
    bool = true;
    [n] = size(A);
    
    for i=1:n
        if abs(A(i,i)) <= sum(abs(A(i, [1:i-1, i+1:n])))
            bool = false;
            break;
        end
    end
    
    if bool
        fprintf("La matriz es de diagonal estrictamente dominante, por lo que el método converge\n")
    else
        fprintf("La matriz no es de diagonal estrictamente dominante, por lo que debemos verificar el segundo teorema\n")  
    end
    
end
