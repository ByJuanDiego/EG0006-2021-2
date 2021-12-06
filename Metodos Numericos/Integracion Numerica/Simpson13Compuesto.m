function [Isc, I, Error] = Simpson13Compuesto(f, a, b, N)

fprintf("\n\n\tIsc = (h/3) * (y(a) + 4*Σ(imp) + 2*Σ(par) + y(b))\n\n")

h = (b-a)/N;
x = (a:h:b);

ximp = x(2:2:N);
xpar = x(3:2:N-1);

Isc = (h/3).* (f(a) + 4.*sum(f(ximp)) + 2.*sum(f(xpar)) + f(b));

%  Para calcular el error
syms x;
I = int(f(x), a, b);
I = round(I, 6);
Error = round(abs(I-Isc), 6);

end
