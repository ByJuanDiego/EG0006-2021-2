function [S]=SplineCubicoNatural(x,y)
    
    N = length(x)-1;
    
    H = diff(x);
    E = diff(y)./H;
    
    M = [y' x' [H NaN]' [E NaN]'];
    fprintf("\n    y         x          Δx       Δy/Δx\n\n")
    disp(M);
    
    diagprinc = 2*(H(1:N-1)+H(2:N)); 
    diagsupinf = H(2:N-1);
    
	g0 = 0;
    gn = 0;
    
	A = diag(diagprinc)+diag(diagsupinf,1)+diag(diagsupinf,-1);
	b = 6*diff(E'); g=A\b;
	g = [g0 g' gn];
    
    fprintf("\nM:\n")
    disp(g)

    S = zeros(N, 4);

    for i=1:N
        
        S(i,1) = (g(i+1)-g(i))/(6*H(i));
        S(i,2) = g(i)/2;
        S(i,3) = E(i)-H(i)*(g(i+1)+2*g(i))/6;
        S(i,4) = y(i);
        
        xx = linspace(x(i), x(i+1), 10000);
        yy = S(i,1)*(xx-x(i)).^3+S(i,2)*(xx-x(i)).^2+S(i,3)*(xx-x(i))+S(i,4);
        
        fprintf("z = (x-%f) --> S(%d) = ", x(i), i-1)
        syms z;
        disp(vpa(poly2sym(S(i, :), z), 5))
        plot(xx, yy), hold on
        
    end
    
	grid on, hold off

end