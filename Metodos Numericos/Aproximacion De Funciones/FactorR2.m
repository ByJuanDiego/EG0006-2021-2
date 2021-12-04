function [R2] = FactorR2(x,y)
    
    % Esta función calcula el coeficiente de determinación R^2 del ajuste
    % lineal de datos
    
    n = length(x);
    g1 = polyfit(x,y,1);
    yis = polyval(g1,x);
    ym = sum(y)/n;
    R2 = sum((yis-ym).^2)/sum((y-ym).^2);
    
end
