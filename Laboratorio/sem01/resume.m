%{ 
    Producto de matrices:
    Para que el producto de dos matrices esté definido, sus dimensiones deben ser:
    A(MxN) y B(NxP); A*B != B*A
    sea C = A*B, entonces C tiene dimensiones (MxP)

    Producto de matrices 2x2:

    A = [
        a b;
        c d;
    ]
    B = [
        e f;
        g h;
    ]

    sea C = A*B, entonces:
    C(1,1) = (a*e) + (b*g)
    C(1,2) = (a*f) + (b*g)
    C(2,1) = (c*e) + (d*g)
    C(2,2) = (c*f) + (d*h)
%}

A = [
    1 2; 
    3 4
]; % matriz 2x2
B = [
    5 6; 
    7 8
]; % matriz 2x2
C = A*B;
fprintf("A*B:\n")
disp(C)





%{ 
    -----------------------------------------------------------------------
    Determinante de una matriz:
    Para que una matriz tenga determiante, esta debe ser de (NxN).
    
    Determinante de una 2x2:

    A = [
        a b;
        c d
    ]
    det(A)= (a*d)-(c*d)
    

    Determinante de una 3x3:

    A = [
        a b c;
        d e f;
        g h i
    ]
    det(A) = [(a*e*i)+(d*h*c)+(g*b*f)] - [(c*e*g)+(f*h*a)+(i*b*d)]
    
    Propiedades de determinantes:

    Si el determinante de una matriz es 0, esa matriz no tiene inversa

    det(A*B) = det(A)*det(B)
    det(A') = det(A)
    det(inv(A)) = 1/det(A)
    Sea A una matriz NxN triangular inferior o superior:
    det(A) = A(1,1)*A(2,2)*A(3,3)*...*A(N,N)

%}

A = ones(3); % crea una matriz 3x3 llena de 1's
fprintf("det(A) = %d\n\n", det(A))





%{
    -----------------------------------------------------------------------
    Adjunta de una matriz:
    Para que una matriz tenga adjunta, debe de ser cuadrada (NxN)

    Adjunta de una 3x3:
    A = [
        a b c;
        d e f;
        g h i;
    ]
    
    sea B = (adjunta de A), entonces:
    B(1,1) = +[(e*i)-(h*f)]
    B(1,2) = -[(d*i)-(g*f)]
    B(1,3) = +[(d*h)-(g*e)]

    B(2,1) = -[(b*i)-(h*c)]
    B(2,2) = +[(a*i)-(g*c)]
    B(2,3) = -[(a*h)-(g*b)]

    B(3,1) = +[(b*f)-(e*c)]
    B(3,2) = -[(a*f)-(d*c)]
    B(3,3) = +[(a*e)-(d*b)]

%}





%{
    -----------------------------------------------------------------------
    Transpuesta de una matriz:
    Es una matriz que tiene como columnas las filas de la matriz original.
    sea A una matriz de orden (MxN), entonces la transpuesta (A') es de orden (NxM)

    A = [
        a b c;
        d e f;
        g h i
    ]
    
    A' = [
        a d g;
        b e h;
        c f i
    ]
%}

A = [
    1 2 3;
    4 5 6;
];

fprintf("A':\n")
disp(A')





%{ 
    -----------------------------------------------------------------------
    Inversa de una matriz:
    
    inv(A) = adj(A')/det(A)

    Definición:
    inv(A)*A = I; donde I es una matriz identidad
    
    Propiedades de inversas:
    inv(A*B) = inv(A)*inv(B)
    inv(A') = inv(A)'
    inv(inv(A)) = A
    inv(α*A) = (1/α)*inv(A); α≠0
    
%}
A = [
    1 2 3;
    3 2 3;
    3 3 3
];

fprintf("inv(A):\n")
disp(inv(A))