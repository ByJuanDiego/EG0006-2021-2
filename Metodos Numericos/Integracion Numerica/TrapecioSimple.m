function [Its, Ets, IEts] = TrapecioSimple(f, a, b)

syms x;

h = (b-a);
Its = (h/2)*(f(a) + f(b));

fprintf("\n\nFórmula: (h/2)*(f(a) + f(b))\n");
fprintf("h = %f\n", h);
fprintf("y(a) = %f\n", f(a));
fprintf("y(b) = %f\n", f(b));

% Para calcular el error
IEts = int(f(x),a,b);
IEts = round(IEts, 5);
Ets =  round(abs(IEts-Its), 5);

end
