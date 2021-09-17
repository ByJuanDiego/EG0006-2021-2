function [Ea, nb] = EliminacionGaussianaSinPivoteo(A,b)

%{
    Esta funcion lleva el sistema original 
    Ax=b al un sistema Ea(x)=nb 
%}

if RoucheFrobenius(A, b)
    
    Aa = [A b];
    [n, m] = size(A);
    
    for k = 1: n-1
        pivo = A(k,k);
        
        for j=k+1:n
            m = Aa(j,k)/pivo;
            Aa(j,:) = Aa(j,:) - m*Aa(k,:);
        end
        
    end
    
    Ea = Aa(:, 1:n);
    nb = Aa(:, n+1);
    
else
    Ea = A;
    nb = b;
end

end
