function [S, z]=SplineCubicoNatural(x,y)
    
    N = length(x)-1;
    
    H = diff(x);
    E = diff(y)./H;
    
    diagprinc = 2*(H(1:N-1)+H(2:N));
    diagsupinf = H(2:N-1);
    
	g0 = 0;
    gn = 0;
    
	A = diag(diagprinc)+diag(diagsupinf,1)+diag(diagsupinf,-1);
	b = 6*diff(E'); g=A\b;
	g = [g0 g' gn];
    
    z = [y' x' [H NaN]' [E NaN]' g'];
    fprintf('\n    y         x          Δx       Δy/Δx    S"(xi)\n\n')
    disp(z);
    
    S = zeros(N, 4);
    
    for i=1:N
        
        S(i,1) = (g(i+1)-g(i))/(6*H(i));
        S(i,2) = g(i)/2;
        S(i,3) = E(i)-H(i)*(g(i+1)+2*g(i))/6;
        S(i,4) = y(i);
        
        xx = linspace(x(i), x(i+1));
        yy = S(i,1)*(xx - x(i)).^3 + S(i,2)*(xx - x(i)).^2 + S(i,3)*(xx - x(i)) + S(i,4);
        plot(xx, yy), hold on
        
        syms r;
        fprintf("r = (x-%f) --> S(%d) = ", x(i), i-1)
        disp(vpa(poly2sym(S(i, :), r), 5))
        
    end
    
	grid on, hold off
    
end