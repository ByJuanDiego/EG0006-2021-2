% Este código calcula el polonomio de interpolación P5(x) de grado 5
% que interpola los 6 datos dados con la función polyfit de Matlab y 
% luego produce su gráfica resaltando los puntos de interpolación.
% Polyval evalúa el polinomio que genera polyfit en o los puntos dados. 
x=[0 2 6 7 12 15]
y=[0 4 4 6 7 1]
p=polyfit(x,y,5)
xx=[0:0.01:15];
yy=polyval(p,xx);
plot(x,y,'or',xx,yy,'b')
grid on