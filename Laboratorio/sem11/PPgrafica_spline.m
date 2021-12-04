% Este código calcula el spline cúbico producido por la función spline de 
% Matlab y grafica el resultado. 

% Cálculo de 100 puntos de la gráfica de S(x)
xx=linspace(0,15,100);
yy=spline(x,y,xx);
% Gráfica de la función spline S(x) sobre el conjunto de datos (x,y)
hold on
plot(xx,yy,'m')
legend('Data','Interpolacion','Spline')
