function [booleano] = RoucheFrobenius(A,b)

    %{
    Esta función verifica el teorema de Rouche Frobenius.

    "Si el rango de la matriz original es igual al de la matriz ampliada, e
    igual al número de columnas de la matriz, entonces tiene única solución, y
    es compatible determinado.

    Caso contrario, si el rango de la matriz original es igual al de la
    ampliada, pero menor a la dimensión de la matriz, entonces es
    compatible indeterminado (infinitas soluciones).

    Finalmente, si el rango de la matriz original es diferente al de la
    ampliada, entonces el sistema es incompatible (no tiene solución).
    "

    Parámetros
    A: La matriz de coeficientes
    v: El vector columna

    %}

    [n, m] = size(A);
    rA = rank(A);
    rAb = rank([A b]);

    if rA ~= rAb
        booleano = false;
    elseif rA == m
        booleano = true;
    else
        booleano = false;
    end
    
end

