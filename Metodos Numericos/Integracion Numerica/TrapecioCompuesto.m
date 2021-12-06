function [Itc, I, Error] = TrapecioCompuesto(f, a, b, N)

fprintf("\n\n\tItc = (h/2) * (f(a) + 2*Σ(f(xi)) + f(b))\n")

h = (b-a)/N;
x = (a:h:b);

Itc = (h/2)*(f(a)+2*sum(f(x(2:length(x)-1))) + f(b));

% Para calcular el error
syms x;
I = int(f(x),a,b);
I = round(I, 5); % redondea a 4 decimales
Error = round(abs(I-Itc), 5);

end

