function [T, g] = Euler(f, a, b, y0, h)
    
    %
    % Función que calcula la tabla de Euler (T)
    % y la solución de la ecuación diferencial de primer orden (g(x)).
    % 
    % dy/dx = f(x,y)
    % y(a) = y0; 
    % 
    % y(i+1) = y(i) + K1(i)
    % 
    % K1(i) = h*f(x(i), y(i))
    
    syms y(x) x
    
    y(x)=dsolve(diff(y,x)==f(x,y), y(a)==y0); %#ok<NODEF>
    fprintf("\n")
    pretty(y)
    
    g = inline(subs(y(x)), 'x'); %#ok<DINLN>
    
    n = (b-a)/h;
    y = y0;
    x = a;
    z = [];
        
    for i = 0:n 
        
        K1 = f(x, y);
        
        error = abs(g(x)-y);
        z = [z; i x y g(x) K1 error]; %#ok<AGROW>
        
        y = y + h*K1;
        x = x + h;
        
    end
    
    varNames = {'i', 'x[i]', 'y[i]', 'g(x[i])', 'K1', 'Error'};
    T = array2table(z, VariableNames=varNames);
    disp(T);
    
end
