function[L,U,flag] = doolittle(A)
% Esta función calcula la factorización LU de A
% mediante el método de Doolittle sin pivoteo. 
% Si flag = 0 entonces el proceso termina exitosamente
% Si flag = 1 el proceso no termina exitosamente porque se consiguió un pivote cero.
flag = 0
[n,m]=size(A)
L = eye(n,n)
for k=1:n-1
    pivo = A(k,k);
    if pivo == 0 then 
        printf('\n No se puede continuar el proceso porque se consiguió un pivote cero\n')
        flag = 1
        break
    else 
        for j=k+1:n
            L(j,k) = A(j,k)/pivo;
            A(j,:) = A(j,:) - L(j,k) * A(k,:);
        end
    end
end
U = triu(A);   % calcula la triangular superior de A
end
