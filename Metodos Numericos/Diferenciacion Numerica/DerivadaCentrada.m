function [dx] = DerivadaCentrada(f, x, h)

    dx = (f(x+h)-f(x-h))/(2*h);

end

