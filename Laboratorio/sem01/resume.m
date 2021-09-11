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

% -------------------------------------------------------------------------

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

    m3(1, 1) = (a * e) + (b * g)
    m3(1, 2) = (a * f) + (b * g)
    m3(2, 1) = (c * e) + (d * g)
    m3(2, 2) = (c * f) + (d * h)

%}



%{
    Para que una matriz tenga adjunta, debe de ser NxN
%}

%m = [
%    1 2 3;
%    4 5 6;
%    7 8 9
%];

%disp(m)
%disp(adj(m))
%disp(transpose(m))
