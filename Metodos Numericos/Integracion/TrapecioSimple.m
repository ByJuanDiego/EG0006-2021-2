function [Its, I, Error] = TrapecioSimple(f, a, b)
    % Its = (h/2) * (f(a) + f(b))
    % I = Its - [(h^3)/12 * f"(ξ)], ξ ∈ [a, b]
    
    h = (b-a);
    
    Its = (h/2)*(f(a) + f(b));
    
    syms x;
    I = int(f(x),a,b);
    I = round(I, 5);
    Error =  round(abs(I-Its), 5);
    
end

