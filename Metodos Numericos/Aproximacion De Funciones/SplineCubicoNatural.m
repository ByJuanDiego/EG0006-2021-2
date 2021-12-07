function [S, T]=SplineCubicoNatural(x, y)
    
    N = length(x)-1;
    H = diff(x);
    E = diff(y)./H;
    diagprinc = 2*(H(1:N-1)+H(2:N));
    diagsupinf = H(2:N-1);
	g0 = 0;
    gn = 0;
	A = diag(diagprinc)+diag(diagsupinf,1)+diag(diagsupinf,-1);
	b = 6*diff(E'); 
    g=A\b; 
    g = [g0 g' gn];
    
    variableNames = {'x','y','Δx', 'Δy/Δx', 'S"(x)'};
    T = table(x',y',[H nan]',[E nan]',g', VariableNames=variableNames);
    fprintf("\n");
    disp(T);
    
    S = zeros(N, 4);
    for i=1:N
        
        S(i,1) = (g(i+1)-g(i))/(6*H(i));
        S(i,2) = g(i)/2;
        S(i,3) = E(i)-H(i)*(g(i+1)+2*g(i))/6;
        S(i,4) = y(i);
        
        xx = linspace(x(i), x(i+1));
        yy = S(i,1)*(xx - x(i)).^3 + S(i,2)*(xx - x(i)).^2 + S(i,3)*(xx - x(i)) + S(i,4);
        plot(xx, yy), hold on
        
        ImprimirS(S, x, i);
        
    end
    
	grid on
    hold off
    
end


function [] = ImprimirS(S, x, i)

    s = "S(" + num2str(i-1) + ") = ";
    r = "*(x-" + num2str(x(i)) + ")";
    a3 = num2str(abs(S(i, 1)));
    a2 = num2str(abs(S(i, 2)));
    a1 = num2str(abs(S(i, 3)));
    a0 = num2str(abs(S(i, 4)));
    xinf = num2str(x(i));
    xsup = num2str(x(i+1));
    sign3 = "  ";
    if S(i, 1) < 0
        sign3 = "- ";
    end
    sign2 = "+ ";
    if S(i, 2) < 0
        sign2 = "- ";
    end
    sign1 = "+ ";
    if S(i, 3) < 0
        sign1 = "- ";
    end
    sign0 = "+ ";
    if S(i, 4) < 0
        sign0 = "- ";
    end
    fprintf(s ...
        + sign3 + a3 + r + "^3   "...
        + sign2 + a2 + r + "^2   "...
        + sign1 + a1 + r + "  "...
        + sign0 + a0...
        + "   si x ∈ [" + xinf + ", " + xsup + "]\n")
    
end