syms x;

f =@(x) x.^2/10 - 2*sin(x);

xx = [0 1 2];
yy = f(xx);

p = polyfit(xx, yy, 2)
xx1 = linspace(0, 2);
yy1 = polyval(p, xx1);

plot(xx1, yy1);