xx=linspace(-4,4);
p=[2 0 -6 5];
yy=polyval(p,xx);
plot(xx,yy,'r')
title('funcion polinomial')
xlabel('Eje X')
ylabel('Eje Y')
grid on