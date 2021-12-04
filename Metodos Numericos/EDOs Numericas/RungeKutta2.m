function [z, g] = RungeKutta2(f, a, b, y0, h, metodo)
    
    %{ Función que calcula la tabla de Runge Kutta de segundo orden (z)
    %  utilizando los métodos de Heun, Ralston o Punto Medio
    %} y la solución de la ecuación diferencial de primer orden (g). 
    
    syms y(x) x
    y(x) = dsolve(diff(y,x)==f(x,y), y(a)==y0); %#ok<NODEF>
    fprintf("\n")
    pretty(y)
    
    g = inline(subs(y(x)),'x'); %#ok<DINLN>
    
    if strcmp(metodo, 'Heun') 
        a2 = 1/2;
    elseif strcmp(metodo, 'Ralston')
        a2 = 2/3;
    elseif strcmp(metodo, 'Punto Medio')
        a2 = 1;
    else
        a2 = 1/2;
    end
    
    a1  = 1 - a2;
    q11 = 1/(2*a2);
    p1  = 1/(2*a2);
    
    n = (b-a)/h;
    y = y0;
    x = a;
    z = [];
    
    fprintf("\nFórmula: y(i+1) = y(i) + h(%s*K1(i) + %s*K2(i))\n\n", string(a1), string(a2))
    fprintf("K1(i) = f(x(i), y(i))\n")
    fprintf("K2(i) = f(x(i)+%s*h, y(i)+%s*K1(i)*h)\n", string(p1), string(q11))
    
    fprintf("\n    i         x(i)      y(i)      g(x(i))   Error    K1(i)     K2(i)\n")
    
    for i = 0:n
        
        K1 = f(x     , y);
        K2 = f(x+p1*h, y+q11*K1*h);
        
        error = abs(g(x)-y);
        z = [z; i x y g(x) error K1 K2]; %#ok<AGROW>
        
        y = y + h*(a1*K1 + a2*K2);
        x = x + h;
        
    end
    
    disp(z);
    
end

