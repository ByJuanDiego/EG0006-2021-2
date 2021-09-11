%{ 
    Producto de matrices:
    Para que el producto de dos matrices esté definido, sus dimensiones deben ser:
    A(MxN) y B(NxP), respectivamente; A*B != B*A
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

    m1 = [
        a b;
        c d;
    ]
    m2 = [
        e f;
        g h;
    ]

    m3 = m1*m2
    m3(1,1) = (a*e) + (b*g)
    m3(1,2) = (a*f) + (b*g)
    m3(2,1) = (c*e) + (d*g)
    m3(2,2) = (c*f) + (d*h)

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
    Para que una matriz tenga adjunta, debe de ser NxN

    Adjunta de una 3x3
    m1 = [
        a b c;
        d e f;
        g h i;
    ]
    
    m2(1,1) = +[(e*i)-(h*f)]
    m2(1,2) = -[(d*i)-(g*f)]
    m2(1,3) = +[(d*h)-(g*e)]

    m2(2,1) = -[(b*i)-(h*c)]
    m2(2,2) = +[(a*i)-(g*c)]
    m2(2,3) = -[(a*h)-(g*b)]

    m2(3,1) = +[(b*f)-(e*c)]
    m2(3,2) = -[(a*f)-(d*c)]
    m2(3,3) = +[(a*e)-(d*b)]

%}





% -------------------------------------------------------------------------





%{
    Transpuesta de una matriz:
    Es una matriz que tiene como columnas las filas de la matriz original
    
    m1 = [
        a b c;
        d e f;
        g h i
    ]
    
    m1' = [
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

