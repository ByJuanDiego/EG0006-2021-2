L =[
    1    0     0    0;
    2    1     0    0;
    1/2  3     1    0;
   -1   -1/2   2    1;
];

U = [
    6  -2   2   4;
    0  -4   2   2;
    0   0   2  -5;
    0   0   0  -3;
];

%{

    Doolitle sin pivoteo.

    Ax = b
    A  = LU
    
    LUx = b

    Ux = c
    Lc = b

    L = matriz triangular superior con diagonal llena de 1's
    U = matriz triangular inferior

%}





%{

    Crout sin pivoteo.

    Ax = b
    A  = LU
    
    LUx = b

    Ux = c
    Lc = b

    L = matriz triangular inferior
    U = matriz triangular superior con diagonal llena de 1's
    
%}
