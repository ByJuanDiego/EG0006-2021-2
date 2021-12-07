function [T, g] = RungeKutta2(f, g, a, b, y1_0, y2_0, h)
    
    n = (b-a)/h;
    y1 = y1_0;
    y2 = y2_0;
    t = a;
    z = [];
    
    for i = 0:n
        
        K1y1 = f(t, y1, y2);
        K1y2 = g(t, y1, y2);
        
        K2y1 = f(t+h, y1+h*K1y1, y2+h*K1y2);
        K2y2 = g(t+h, y1+h*K1y1, y2+h*K1y2);
        
        z = [z; i t y1 y2 K1y1 K1y2 K2y1 K2y2]; %#ok<AGROW> 
        
        y1 = y1 + h/2*(K1y1 + K2y1);
        y2 = y2 + h/2*(K1y2 + K2y2);
        t = t + h;
        
    end
    
    varNames = {'i', 't[i]','y1[i]', 'y2[i]', 'K1y1', 'K1y2', 'K2y1', 'K2y2'};
    T = array2table(z, VariableNames=varNames);
    disp(T);
    
end

