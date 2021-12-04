function [ITrapAprox, Iexacta, ErrorTrap, xx, yy] = trapecompTAP(f, g, a, i, b, N)

syms x;
h=(b-a)/N;

xx = linspace(a, b, N+1);
yy = zeros(1, length(xx));

for j = 1:length(xx)
    
    if xx(1, j) <= i
        yy(1, j) = f(xx(1, j));
        
    else
        yy(1, j) = g(xx(1, j));
        
    end
    
end

ITrapAprox=(h/2)*(yy(1) + 2*sum(yy(2:length(yy)-1)) + yy(length(yy)));

% Para calcular el error

Iexacta = int(f(x), a, i) + int(g(x), i, b);
ErrorTrap = vpa(abs(Iexacta-ITrapAprox),4);

end
