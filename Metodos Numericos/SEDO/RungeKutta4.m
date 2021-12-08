function [T] = RungeKutta4(f, g, a, b, x0, y0, h)
    
    % 
    % Función que calcula los valores de x(b) & y(b) con un paso (h)
    % 
    % dx/dt = f(t, x, y);   x(a) = x0
    % dy/dt = g(t, x, y);   y(a) = y0
    % 
    % x(i+1) = x(i) + h/6*(K1x(i) + 2*K2x(i) + 2*K3x(i) + K4x(i));
    % y(i+1) = y(i) + h/6*(K1y(i) + 2*K2y(i) + 2*K3y(i) + K4y(i));
    % 
    % K1x(i) = f(t(i), x(i), y(i))
    % K1y(i) = g(t(i), x(i), y(i))
    % 
    % K2x(i) = f(t(i)+h/2, x(i)+K1x(i)/2, y(i)+K1y(i)/2)
    % K2y(i) = g(t(i)+h/2, x(i)+K1x(i)/2, y(i)+K1y(i)/2)
    %
    % K3x(i) = f(t(i)+h/2, x(i)+K2x(i)/2, y(i)+K2y(i)/2);
    % K3y(i) = g(t(i)+h/2, x(i)+K2x(i)/2, y(i)+K2y(i)/2);
    %
    % K4x(i) = f(t(i)+h, x(i)+K3x(i), y(i)+K3y(i));
    % K4y(i) = g(t(i)+h, x(i)+K3x(i), y(i)+K3y(i));
    
    n = (b-a)/h;
    x = x0;
    y = y0;
    t = a;
    z = [];
    
    for i = 0:n
        
        K1x = f(t, x, y);
        K1y = g(t, x, y);
        
        K2x = f(t+h/2, x+K1x/2, y+K1y/2);
        K2y = g(t+h/2, x+K1x/2, y+K1y/2);
        
        K3x = f(t+h/2, x+K2x/2, y+K2y/2);
        K3y = g(t+h/2, x+K2x/2, y+K2y/2);
        
        K4x = f(t+h, x+K3x, y+K3y);
        K4y = g(t+h, x+K3x, y+K3y);
        
        z = [z; i t x y K1x K1y K2x K2y K3x K3y K4x K4y]; %#ok<AGROW> 
        
        x = x + h/6*(K1x + 2*K2x + 2*K3x + K4x);
        y = y + h/6*(K1y + 2*K2y + 2*K3y + K4y);
        t = t + h;
        
    end
    
    varNames = {'i', 't[i]','x[i]', 'y[i]', 'K1x', 'K1y', 'K2x', 'K2y', 'K3x', 'K3y', 'K4x', 'K4y'};
    T = array2table(z, VariableNames=varNames);
    disp(T);
    
end

