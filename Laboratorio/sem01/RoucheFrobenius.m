function [] = RoucheFrobenius(M, v)

%{
    Esta función verifica el teorema de Rouche Frobenius.

    "Si el rango de la matriz original es igual al de la matriz ampliada, e
    igual al de la dimensión de la matriz, entonces tiene única solución, y
    es compatible determinado.

    Caso contrario, si el rango de la matriz original es igual al de la
    ampliada, pero menor a la dimensión de la matriz, entonces es
    compatible indeterminado (infinitas soluciones).

    Finalmente, si el rango de la matriz original es diferente al de la
    ampliada, entonces el sistema es incompatible (no tiene solución).
    "

    Parámetros
    M: La matriz
    v: El vector columna 

%}

[n, m] = size(M);
r1 = rank(M);
r2 = rank([M v]);

if (r1 ~= r2)
    fprintf("El sistema no tiene solución\n")
elseif (r1 == n)
    fprintf("El sistema tiene solución única\n")
else
    fprintf("El sistema tiene infinitas soluciones\n")
end
