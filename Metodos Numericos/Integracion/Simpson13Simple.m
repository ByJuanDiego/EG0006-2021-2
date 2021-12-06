function [Iss, I, Error] = Simpson13Simple(f, a, b)

fprintf("\n\n\tIss = (h/3) * (f(a) + 4*f(c) + f(b))\n")

h = (b-a)/2;
c = (a+b)/2;

Iss = (h/3) * (f(a) + 4*f(c) + f(b));

% Para calcular el error
syms x;
I = int(f(x), a, b);
I = round(I, 5); 
Error = round(abs(I-Iss), 5);

end
