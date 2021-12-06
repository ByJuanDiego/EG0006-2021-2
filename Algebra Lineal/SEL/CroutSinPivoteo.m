function [L, U] = CroutSinPivoteo(A)
    
    % Factorizacion por el metodo de Crout
    
    [~,n] = size(A);
    L = A;
    U = eye(n);

    for k = 1:n-1
        pivo = L(k,k);
        for j = k+1:n
            U(k,j) = L(k,j)/pivo;
            L(:,j) = L(:,j)-U(k,j)*L(:,k);
        end
    end
    
end
