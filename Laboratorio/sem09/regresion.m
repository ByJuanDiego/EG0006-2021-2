x = [1 3 10 16]';
y = [4 7 12 8 ]';

g1 = polyfit(x, y, 1);

% Graficando

xx = [min(x) : 0.01 : max(x)];
yy1 = polyval(g1, xx);
plot(xx, yy1, 'r', x, y, 'ob');
grid on
title('Ajuste lineal')
