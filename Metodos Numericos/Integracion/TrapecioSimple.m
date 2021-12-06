function [Its, I, Error] = TrapecioSimple(f, a, b)

fprintf("\n\n\tIts = (h/2) * (f(a) + f(b))\n");

h = (b-a);

Its = (h/2)*(f(a) + f(b));

% Para calcular el error
syms x;
I = int(f(x),a,b);
I = round(I, 5);
Error =  round(abs(I-Its), 5);

end
