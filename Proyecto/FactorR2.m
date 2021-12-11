function [R2] = FactorR2(x, y, grado)
    
    % Esta función calcula el coeficiente de determinación R^2 del ajuste
    % polinomial de datos
    
    P = polyfit(x, y, grado);
    yi = polyval(P, x);
    
    n = length(x);
    ym = sum(y)/n;
    
    R2 = sum((yi - ym).^2)/sum((y - ym).^2);
    
end
