function [z, xi] = NewtonRaphsonTOL(f, x0, Tol)
    
    syms x;
    df = diff(f, x);
    df = inline(df); %#ok<DINLN>
    
    i = 0;
    z = [i x0 f(x0) df(x0) nan];
    
    fprintf("\nFórmula: x(i+1) = x(i) - f(x(i))/f'(x(i))\n")
    fprintf("\n    i         x(i)      f(xi)     f'(xi)    Error\n");
    
    error = 1;
    while error > Tol
        
        xi = x0 - f(x0)/df(x0);
        error = abs(xi - x0);
        i = i + 1;
        
        z = [z; i xi f(xi) df(xi) error]; %#ok<AGROW>
        x0 = xi;
        
    end
    
    disp(z);
    
end