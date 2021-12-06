function [bool] = MatrizDominante(A)
    
    bool = true;
    [n] = size(A);
    
    for k=1:n
        if abs(A(k,k)) <= sum(abs(A(k, [1:k-1, k+1:n])))
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
