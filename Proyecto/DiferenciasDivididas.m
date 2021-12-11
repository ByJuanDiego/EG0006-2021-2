function [M] = DiferenciasDivididas(x,y)
    
    n = length(x);
    M = zeros(n);
    M(1:n,1) = y;
    
    for k = 1:n-1
        dx = x(k+1:n) - x(1:n-k);
        dydx = diff(y)./dx;
        M(1:n-k,k+1) = dydx;   
        y = dydx;
    end
    
    M = [x M];
    
end
