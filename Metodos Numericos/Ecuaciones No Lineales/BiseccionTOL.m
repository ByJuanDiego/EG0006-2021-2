function [T, c] = BiseccionTOL(f, a, b, Tol)
    
    % Calcula la solución (c) de la ecuación f(x)=0 tal que f(c)=0
    % Antes de llamar a la función se debe verificar que:
    % • a < b
    % • f(a)*f(b) < 0
    
    c = (a+b)/2;
    error = abs(b-a)/2;
    i = 0;
    z = [i a b c f(a) f(b) f(c) error];
    
    while error > Tol
        
        if f(a)*f(c) < 0
            b=c;
        else
            a=c;
        end
        
        i = i + 1;
        c = (a+b)/2;
        error = abs(b-a)/2;
        z = [z; i a b c f(a) f(b) f(c) error]; %#ok<AGROW>
        
    end
    
    variableNames = {'i','a','b','c','f(a)','f(b)','f(c)','error'};
    T = table(z(:,1),z(:,2),z(:,3),z(:,4),z(:,5),z(:,6),z(:,7),z(:,8),VariableNames=variableNames);
    disp(T);
    
    

end

