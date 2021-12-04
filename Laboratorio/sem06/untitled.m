A = [2 4 5;
     5 6 7;
     1 5 6];
 
x0 = [0;0;1];

[z]=potencia(A,x0,50);

binary1 = dec2bin(150);
binary2 = dec2base(150, 2);


M = [
    -5 -6;
    2.6  4
];

eig(M)
