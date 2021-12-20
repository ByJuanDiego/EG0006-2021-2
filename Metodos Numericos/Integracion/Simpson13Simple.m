function [Iss, I, Error] = Simpson13Simple(f, a, b)
    % Iss = (h/3) * (f(a) + 4*f(c) + f(b))
    % I = Iss - [(h^5)/90 * d^4f(x)/dx^4(ξ)], ξ ∈ [a, b]
    
    h = (b-a)/2;
    c = (a+b)/2;
    
    Iss = (h/3) * (f(a) + 4*f(c) + f(b));
    
    syms x;
    I = int(f(x), a, b);
    I = round(I, 5); 
    Error = round(abs(I-Iss), 5);

end

