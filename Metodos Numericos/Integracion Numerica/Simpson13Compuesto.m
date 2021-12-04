function [Isc, Esc, IEsc] = Simpson13Compuesto(f, a, b, N)

syms x;

h = (b-a)/N; 
xx = linspace(a, b, N+1);

ximpar = xx(2:2:N); % los impares en Matlab comienzan desde 2
xpar = xx(3:2:N-1);

Isc = (h/3).* (f(a) + 4.*sum(f(ximpar)) + 2.*sum(f(xpar)) + f(b));

fprintf("x\n")
disp(xx)

fprintf("y\n")
disp(f(xx))

fprintf("\n\nFórmula: Isc = h/3 * (y(0) + 4*Σ(imp) + 2*Σ(par) + y(n))\n\n")

fprintf("\nh = %f\n\n", h)

fprintf("Sumatoria de los y(x) impares\n")
disp(sum(f(ximpar)))

fprintf("Sumatoria de los y(x) pares\n")
disp(sum(f(xpar)))

%  Para calcular el error
IEsc = int(f(x), a, b);
IEsc = round(IEsc, 6);
Esc = round(abs(IEsc-Isc), 6);

end
