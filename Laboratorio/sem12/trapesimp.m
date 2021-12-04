function [Itrapsimp,Error] = trapesimp(f, a, b)

syms x;

h=b-a;
Itrapsimp=(h/2)*(f(a)+f(b));

% Para calcular el error
Vexacto = int(f(x),a,b);
Vex = vpa(Vexacto,4);
Error =  vpa(abs(Vex-Itrapsimp),4);

end
