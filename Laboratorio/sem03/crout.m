function[L, U]= crout(A)

% Esta función calcula la factorización LU de A
% mediante el método de Crout sin pivoteo. 
%  Inicialización

[n,m] = size(A);
U = eye(n,n);
%  Proceso de EG - haciendo las modificaciones sobre la A
for k = 1:n - 1
    pivo = A(k,k);  % cálculo del pivote
    for i = k+1:n
            U(k,i)= A(k,i)/pivo;  % cálculo el multiplicador m_ki
            A(:,i) = A(:,i) - U(k,i)*A(:,k);  % actualización de la columna i
    end
end
L = tril(A);  % tril(A) es la matriz triangular inferior de la A
% triu(A) es la matriz trigular superior de A

end
