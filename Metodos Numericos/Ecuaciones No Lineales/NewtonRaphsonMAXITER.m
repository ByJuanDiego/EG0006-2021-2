function [z, xi] = NewtonRaphsonMAXITER(f, x0, maxIter)
    
    syms x;
    df = diff(f, x);
    df = inline(df); %#ok<DINLN>
    

    z = [0 x0 f(x0) df(x0) nan];
    
    fprintf("\nFórmula: x(i+1) = x(i) - f(x(i))/f'(x(i))\n")
    fprintf("\n    i         x(i)      f(xi)     f'(xi)    Error\n");
    

    for i=1:maxIter

        xi = x0 - f(x0)/df(x0);
        error = abs(xi - x0);
        
        
        z = [z; i xi f(xi) df(xi) error]; %#ok<AGROW>
        x0 = xi;

    end
    
    disp(z);
    
end
