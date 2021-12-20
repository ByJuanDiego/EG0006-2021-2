function [dx] = DerivadaAdelante(f, x0, h)
    
    %
    % dx = [f(x0+h) - f(x0)]/(h)
    % f'(x0) = dx - [f"(ξ)*(h/2)], ξ ∈ [x0, x0+h]
    
    dx = (f(x0+h) - f(x0))/(h);
    
end

