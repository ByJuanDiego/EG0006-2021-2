function [Isimpcomp, Error] = simpcomp(f, a, b, N)

syms x;

h = (b-a)/N; xx = linspace(a, b, N+1);
ximpar = xx(2:2:N); % los impares en Matlab comienzan desde 2
xpar = xx(3:2:N-1);

Isimpcomp = (h/3).* (f(a) + 4.*sum(f(ximpar)) + 2.*sum(f(xpar)) + f(b));

%  Para calcular el error
Vexacto=int(f(x), a, b);
Vex=vpa(Vexacto,4); % redondea a 4 decimales
Error = vpa(abs(Vex-Isimpcomp),4);

end
