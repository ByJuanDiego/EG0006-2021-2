function [dx] = DerivadaAdelante(f, x, h)
    
    dx = (f(x+h) - f(x))/(h);
    
end

