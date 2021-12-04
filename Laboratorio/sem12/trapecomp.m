function [Itrapcomp,Error] = trapecomp(f, a, b, N)

syms x;

h=(b-a)/N; % N es el numero de subintervalos
xx = linspace(a, b, N+1);
Itrapcomp=(h/2)*(f(a)+2*sum(f(xx(2:length(xx)-1))) + f(b));

% Para calcular el error
Vexacto = int(f(x),a,b);
Vex = vpa(Vexacto,4); % redondea a 4 decimales
Error = vpa(abs(Vex-Itrapcomp),4);

end
