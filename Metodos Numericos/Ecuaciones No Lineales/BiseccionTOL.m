function [z, c] = BiseccionTOL(f, a, b, Tol)
    
    c = (a+b)/2;
    error = abs(b-a)/2;
    i = 0;
    z = [i a b c f(a) f(b) f(c) error];
    
    fprintf("\n\n    a         b         c         f(a)      f(b)      f(c)      error\n")
    
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
    
    disp(z);

end
