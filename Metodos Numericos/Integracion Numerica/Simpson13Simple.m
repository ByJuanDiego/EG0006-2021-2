function [Iss, Ess, IEss] = Simpson13Simple(f, a, b)

syms x;

h = (b-a)/2; 
c = (a+b)/2;

fprintf("\n\nFórmula: Iss = h/3 * (y(a) + 4*y(c) + y(b))\n")
fprintf("\nh = %f\n\n", h)
fprintf("Fórmula: Iss = %f/3 * (y(%f) + 4*y(%f) + y(%f))\n\n", h, a, c, b)

Iss = (h/3) * (f(a) + 4*f(c) + f(b));

% Para calcular el error
IEss = int(f(x), a, b);
IEss = round(IEss, 5); 
Ess = round(abs(IEss-Iss), 5);

end
