function [z, c] = BiseccionMAXITER(f, a, b, maxIter)
    
    c = (a+b)/2;
    error = abs((b-a)/2);

    z = [0 a b c f(a) f(b) f(c) error];
    
    fprintf("\n\n    i         a         b         c         f(a)      f(b)      f(c)      error\n")
    
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
    
    disp(z)
    
end
