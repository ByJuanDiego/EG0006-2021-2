function [dx] = DerivadaCentrada(f, x0, h)
    
    %
    % dx = [f(x0+h)-f(x0-h)]/(2*h)
    % f'(x0) = dx + [d^3f(x)/dx^3(ξ)*(h^2)/6], ξ ∈ [x0-h, x0+h]
    
    dx = (f(x0+h)-f(x0-h))/(2*h);

end

