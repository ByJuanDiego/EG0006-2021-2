function [ISimpaprox, Iexacta, ErrorSimp, xx, yy] = simpcompTAP(f, g, a, i, b, N)

syms x;

h=(b-a)/N; % N es el numero de subintervalos

xx = linspace(a, b, N+1);
yy = zeros(1, length(xx));

for j= 1:length(xx)
    if xx(1, j) <= i
        yy(1, j) = f(xx(1, j));
    else
        yy(1, j) = g(xx(1, j));
    end
end

yyimpar = yy(2:2:N);
yypar = yy(3:2:N-1);

ISimpaprox=(h/3)*(yy(1) + 4*sum(yyimpar) +2*sum(yypar) + yy(length(yy)));

% Para calcular el error

Iexacta = int(f(x), a, i) + int(g(x), i, b);
ErrorSimp = vpa(abs(Iexacta-ISimpaprox),4);

end
