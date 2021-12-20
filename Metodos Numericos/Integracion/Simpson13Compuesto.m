function [Isc, I, Error] = Simpson13Compuesto(f, a, b, N)
    % Isc = (h/3) * (y(a) + 4*Σ(imp) + 2*Σ(par) + y(b))
    % I = Isc - [(b-a)/180 * d^4f(x)/dx^4(ξ) * h^4], ξ ∈ [a, b]
    
    h = (b-a)/N;
    x = (a:h:b);
    
    ximp = x(2:2:N);
    xpar = x(3:2:N-1);
    
    Isc = (h/3).* (f(a) + 4.*sum(f(ximp)) + 2.*sum(f(xpar)) + f(b));
    
    syms x;
    I = int(f(x), a, b);
    I = round(I, 6);
    Error = round(abs(I-Isc), 6);
    
end

