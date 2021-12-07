function [T, xi] = NewtonRaphsonTOL(f, x0, Tol)
    
    % Fórmula: x(i+1) = x(i) - f(x(i))/f'(x(i))
    
    syms x;
    df = diff(f, x);
    df = inline(df); %#ok<DINLN>
    
    i = 0;
    z = [i x0 f(x0) df(x0) nan];
    
    error = 1;
    while error > Tol
        
        xi = x0 - f(x0)/df(x0);
        error = abs(xi - x0);
        i = i + 1;
        
        z = [z; i xi f(xi) df(xi) error]; %#ok<AGROW>
        x0 = xi;
        
    end
    
    variableNames = {'i','x[i]','f(x[i])','f(1)(x[i])', 'error'};
    T = table(z(:,1),z(:,2),z(:,3),z(:,4),z(:,5), VariableNames=variableNames);
    disp(T);
    
end