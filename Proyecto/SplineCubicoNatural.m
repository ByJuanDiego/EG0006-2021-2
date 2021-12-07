function [T1, T2] = SplineCubicoNatural(x, y, color)
    
    N = length(x)-1;
    H = diff(x);
    E = diff(y)./H;
    
    diagprinc = 2*(H(1:N-1)+H(2:N));
    diagsupinf = H(2:N-1);
	A = diag(diagprinc) + diag(diagsupinf,1) + diag(diagsupinf,-1);
	b = 6*diff(E');
    g=A\b;
    g0 = 0; gn = 0;
    g = [g0 g' gn];
    
    S = zeros(N, 4);
    for i=1:N
        
        S(i,1) = (g(i+1)-g(i))/(6*H(i));
        S(i,2) = (g(i)/2);
        S(i,3) = (E(i)-H(i)*(g(i+1)+2*g(i))/6);
        S(i,4) = (y(i));
        
        xx = linspace(x(i), x(i+1));
        yy = S(i,1)*(xx - x(i)).^3 + S(i,2)*(xx - x(i)).^2 + S(i,3)*(xx - x(i)) + S(i,4);
        plot(xx, yy, "Color", color, "LineWidth", 1.5), hold on
        
        limites(i,1) = "si x ∈ [" + num2str(x(i))+ ", " + num2str(x(i+1)) + "]"; %#ok<AGROW> 
        z(i,1) = "(x-" + x(i) + ")"; %#ok<AGROW> 
        
    end
    
    variableNames1 = {'i', 'x','y','h[i]', 'f[x(i),x(i+1)]', 'S"(x[i])'};
    T1 = table((0:1:N)', x', y', [H nan]', [E nan]', g', VariableNames=variableNames1);
    
    variableNames2 = {'i','(x-x[i])','a','b','c', 'd', '[x(i), x(i+1)]'};
    T2 = table((0:1:N-1)',z, S(:,1),S(:,2),S(:,3),S(:,4),limites, VariableNames=variableNames2);
    
    hold off;
end