function [Isimpsimple, Error] = simpsimple(f, a, b)

syms x;

h=(b-a)/2; c=(a+b)/2;
Isimpsimple = (h/3)*(f(a)+4*f(c)+f(b));

% Para calcular el error
Vexacto = int(f(x), a, b);
Vex = vpa(Vexacto, 4); 
Error=vpa(abs(Vex-Isimpsimple),4);

end
