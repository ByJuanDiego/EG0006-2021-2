function [T, g] = Euler(f, a, b, y0, h)
    
    % Fómula: y(i+1) = y(i) + h*f(x(i), y(i))
    
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

        error = abs(g(x)-y);
        z = [z; i x y g(x) error]; %#ok<AGROW>
        
        y = y + h*f(x, y);
        x = x + h;
        
    end
    
    varNames = {'i', 'x[i]', 'y[i]', 'g(x[i])', 'Error'};
    T = array2table(z, VariableNames=varNames);
    disp(T);
    
end
