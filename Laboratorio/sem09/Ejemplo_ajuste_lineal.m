% Hallar un ajuste lineal usando la función polyfit de Matlab.
x=[1 3 10 16]';
y=[4 7 12 8 ]';
g1=polyfit(x,y,1);  % polyfit(x,y,m) calcula el polinomio de grado m que ajusta los n datos, n > m. Retorna el vector de coeficientes en orden descendente.
disp('Los coeficientes del polinomio lineal que ajusta los datos son:')
disp(g1)
% Graficando
xx=[1:0.01:16];
yy1=polyval(g1,xx);
plot(xx,yy1,'r',x,y,'ob')
grid on
title('Ajuste lineal')
axis([0 17 0 17] )
axis('square')


% Otra Manera. Construyendo el Sistema de Ecuaciones Normales.  
M=[x ones(4,1)];  % SEL sobredeterminado
u=inv(M'*M)*M'*y; % solución del sistema de ecuaciones normales
disp('Los coeficientes del polinomio lineal vía el SEN es:')
disp(u)