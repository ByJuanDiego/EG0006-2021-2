function [L, U] = DoolitleSinPivoteo(A)
    
    % Factorizacion por el metodo de Doolitle
    
    [~,n] = size(A);
    U = A;
    L = eye(n);
    
    for k = 1:n-1
        pivo = U(k,k);
        for j = k+1:n
            L(j,k) = U(j,k)/pivo;
            U(j,:) = U(j,:)-L(j,k)*U(k,:);
        end
    end
    
end