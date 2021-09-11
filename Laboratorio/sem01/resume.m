%{ 
    Producto de matrices:
    Para que el producto de dos matrices esté definido, sus dimensiones deben ser:
    A(MxN) y B(NxP); A*B != B*A
    sea C = A*B, entonces C tiene dimensiones (MxP)
%}

A = [
    1 2; 
    3 4; 
    5 6
]; % matriz 3x2

B = [
    1 2; 
    3 4
]; % matriz 2x2

C = A*B; % el nro de columnas de A es igual al nro de filas de B
disp(C)



%{  
    Producto de matrices cuadradas:

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
];
B = [
    5 6; 
    7 8
];
C = A*B;
disp(C)


% -------------------------------------------------------------------------





%{
    Adjunta de una matriz:
    Para que una matriz tenga adjunta, debe de ser cuadrada (NxN)

    Adjunta de una 3x3
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





% -------------------------------------------------------------------------





%{
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

B = A';
disp(B)






% -------------------------------------------------------------------------

%{ 
    Inversa de una matriz:
    inv(A) = adj(A')/det(A)
%}
