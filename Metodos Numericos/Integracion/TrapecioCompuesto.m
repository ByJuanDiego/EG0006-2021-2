function [Itc, I, Error] = TrapecioCompuesto(f, a, b, N)
    % Itc = (h/2) * (f(a) + 2*Σ(f(xi)) + f(b))
    % I = Itc - [(b-a)/12 * f"(ξ) * h^2], ξ ∈ [a, b]
    
    h = (b-a)/N;
    x = (a:h:b);
    
    Itc = (h/2)*(f(a)+2*sum(f(x(2:length(x)-1))) + f(b));
    
    syms x;
    I = int(f(x),a,b);
    I = round(I, 5);
    Error = round(abs(I-Itc), 5);

end

