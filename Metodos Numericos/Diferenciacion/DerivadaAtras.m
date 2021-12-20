function [dx] = DerivadaAtras(f, x0, h)
    
    % dx = [f(x0) - f(x0-h)]/(h)
    % f'(x0) = dx + [f"(ξ)*(h/2)], ξ ∈ [x0-h, x0]
    
    dx = (f(x0) - f(x0-h))/(h);

end

