function [T] = RungeKutta2(f, g, a, b, x0, y0, h)
    
    %
    % Función que calcula los valores de x(b) & y(b) con un paso (h)
    % 
    % dx/dt = f(t, x, y);   x(a) = x0
    % dy/dt = g(t, x, y);   y(a) = y0
    % 
    % x(i+1) = x(i) + h/2*(K1x(i) + K2x(i)) 
    % y(i+1) = y(i) + h/2*(K1y(i) + K2y(i))
    % 
    % K1x(i) = f(t(i), x(i), y(i))
    % K1y(i) = g(t(i), x(i), y(i))
    % 
    % K2x(i) = f(t(i) + h, x(i) + h*K1x(i), y(i) + h*K1y(i));
    % K2y(i) = g(t(i) + h, x(i) + h*K1x(i), y(i) + h*K1y(i));
    
    n = (b-a)/h;
    x = x0;
    y = y0;
    t = a;
    z = [];
    
    for i = 0:n
        
        K1x = f(t, x, y);
        K1y = g(t, x, y);
        
        K2x = f(t+h, x+h*K1x, y+h*K1y);
        K2y = g(t+h, x+h*K1x, y+h*K1y);
        
        z = [z; i t x y K1x K1y K2x K2y]; %#ok<AGROW> 
        
        x = x + h/2*(K1x + K2x);
        y = y + h/2*(K1y + K2y);
        t = t + h;
        
    end
    
    varNames = {'i', 't[i]','x(t[i])', 'y(t([i])', 'K1x', 'K1y', 'K2x', 'K2y'};
    T = array2table(z, VariableNames=varNames);
    disp(T);
    
end

