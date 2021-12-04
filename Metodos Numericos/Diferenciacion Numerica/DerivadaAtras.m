function [dx] = DerivadaAtras(f, x, h)

    dx = (f(x) - f(x-h))/(h);

end

