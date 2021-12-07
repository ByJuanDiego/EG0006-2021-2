function [T, c] = BiseccionMAXITER(f, a, b, maxIter)
    
    c = (a+b)/2;
    error = abs((b-a)/2);

    z = [0 a b c f(a) f(b) f(c) error];
    
    for i = 1:maxIter

        if f(a)*f(c) < 0
            b=c;
        else
            a=c;
        end
        

        c = (a+b)/2;
        error = abs((b-a)/2);
        z = [z; i a b c f(a) f(b) f(c) error]; %#ok<AGROW>
        
    end
    
    variableNames = {'i','a','b','c','f(a)','f(b)','f(c)','error'};
    T = table(z(:,1),z(:,2),z(:,3),z(:,4),z(:,5),z(:,6),z(:,7),z(:,8),VariableNames=variableNames);
    disp(T);
    
end
