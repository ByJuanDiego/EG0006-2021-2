function [z, g] = Euler(f, a, b, y0, h)
    
    syms y(x) x
    
    y(x)=dsolve(diff(y,x)==f(x,y), y(a)==y0); %#ok<NODEF>
    fprintf("\n")
    pretty(y)
    
    g = inline(subs(y(x)), 'x'); %#ok<DINLN>
    
    n = (b-a)/h;
    y = y0;
    x = a;
    z = [];
    
    fprintf("\n\nFómula: y(i+1) = y(i) + h*f(x(i), y(i))\n\n");
    fprintf("\n    i          xi       yi        g(xi)     Error\n");
    
    for i = 0:n 

        error = abs(g(x)-y);
        z = [z; i x y g(x) error]; %#ok<AGROW>
        
        y = y + h*f(x, y);
        x = x + h;
        
    end
    
    disp(z);
    
end
