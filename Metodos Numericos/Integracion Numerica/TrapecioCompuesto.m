function [Itc, Etc, IEtc] = TrapecioCompuesto(f, a, b, N)

syms x;

h=(b-a)/N; % N es el numero de subintervalos
xx = linspace(a, b, N+1);

Itc = (h/2)*(f(a)+2*sum(f(xx(2:length(xx)-1))) + f(b));

fprintf("\n\nFórmula: Itc = h/2 * (y(a) + 2*Σ(y(xi)) + y(b))\n")
fprintf("h = %f\n", h);
fprintf("y(a) = %f\n", f(a));
fprintf("y(b) = %f\n", f(b));
fprintf("Σ(y(xi) / i = 1,2,...,n-1 = %f\n", sum(f(xx(2:length(xx)-1))));

% Para calcular el error
IEtc = int(f(x),a,b);
IEtc = round(IEtc, 5); % redondea a 4 decimales
Etc = round(abs(IEtc-Itc), 5);

end

