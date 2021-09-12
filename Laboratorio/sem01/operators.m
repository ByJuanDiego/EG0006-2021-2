%{
    operadores principales:

    A / B = A * inv(B)
    A \ B = inv(A) * B


    funciones principales matrices:

    zeros(3, 5)
    ones(3, 5)
    eye(5) genera una matriz identidad 5x5 (diagonal llena de 1's)
    trace(A) -> Suma de los elementos de la diagonal de una matriz (traza)
    rank(A) rango de la matriz A
    [n, m] = size(A)
    
    funciones principales sistemas de ecuaciones lineales:
    calcula la única solución de A*x=b

    linsolve(A, b)
    A \ b
    inv(A)*b

%}

