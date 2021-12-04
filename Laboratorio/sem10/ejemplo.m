% p(x) = 2x^3 - 6x + 5 

p = [2 0 -6 5];

% polyval(p, 2);
% polyval(p,[1 2 3 4 5 6 7 8]);
% polyval(p,[0: 0.01: 0.05]);

xx = linspace(1, 2);
yy = polyval(p, xx);

plot(xx, yy, 'r');
title('funcion polinomial');
xlabel('Eje X');
ylabel('Eje Y');
grid on
