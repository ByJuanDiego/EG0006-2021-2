function [M] = DiferenciasDivididasNewton(x,y)
    
    n = length(x);
    M = zeros(n);
    M(1:n,1) = y;
    
    for k = 1:n-1
        dx = x(k+1:n) - x(1:n-k);
        dy_dx = diff(y)./dx;
        M(1:n-k,k+1) = dy_dx;   
        y = dy_dx;
    end
    
    M=[x M];
    
    fprintf("\n\n");
    disp(M);
    
end

