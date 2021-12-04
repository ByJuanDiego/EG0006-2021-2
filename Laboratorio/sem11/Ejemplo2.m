clf

x = [0 10 15 20 22.5 30];
y = [0 227.04 362.78 517.35 602.97 901.67];

xx = linspace(0, 30, 100);
yy = spline(x, y, xx);

t = 4;
v_t = spline(x, y, s);

plot(x, y, 'ob', xx, yy, 'r', t, v_t, 'oc')
