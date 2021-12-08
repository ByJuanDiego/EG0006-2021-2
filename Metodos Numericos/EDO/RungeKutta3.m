function [T, g] = RungeKutta3(f, a, b, y0, h)
    
    %
    % Función que calcula la tabla de Runge Kutta de tercer orden (z) 
    % y la solución de la ecuación diferencial de primer orden (g(x)).
    % 
    % y(i+1) = y(i) + h/6*(K1(i) + 4*K2(i) + K3(i));
    % 
    % K1(i) = f(x(i)    , y(i)                  );
    % K2(i) = f(x(i)+h/2, y(i)+K1(i)*h/2        );
    % K3(i) = f(x(i)+h  , y(i)-K1(i)*h+2*K2(i)*h);
    
    syms y(x) x
    y(x) = dsolve(diff(y, x)==f(x, y), y(a)==y0); %#ok<NODEF>
    fprintf("\n")
    pretty(y)
    
    g = inline(subs(y(x)), 'x'); %#ok<DINLN>
    
    n = (b-a)/h;
    y = y0;
    x = a;
    z = [];
    
    for i = 0:n
        
        K1 = f(x    , y                );
        K2 = f(x+h/2, y + K1*h/2       );
        K3 = f(x+h  , y - K1*h + 2*K2*h);
        
        error = abs(g(x)-y);
        z = [z; i x y g(x) K1 K2 K3 error]; %#ok<AGROW>
        
        y = y + h/6*(K1 + 4*K2 + K3);
        x = x + h;
        
    end
    
    varNames = {'i', 'x[i]', 'y[i]', 'g(x[i])', 'K1', 'K2', 'K3', 'Error'};
    T = array2table(z, VariableNames=varNames);
    disp(T);
    
end

