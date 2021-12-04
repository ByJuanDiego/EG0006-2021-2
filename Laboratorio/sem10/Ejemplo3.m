x=[2 2.75 4]';
f=inline('1./x','x')
y=f(x)
p2=polyfit(x,y,2)
xx=linspace(2,4);
yy1=polyval(p2,xx);
yy2=f(xx);
plot(x,y,'ob',xx,yy1,'r',xx,yy2,'k')
grid on
legend('Nodos','P. Interpolante','Funcion f(x)')