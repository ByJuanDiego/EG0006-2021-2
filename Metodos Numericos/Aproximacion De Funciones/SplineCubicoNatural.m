function [T2, T1]=SplineCubicoNatural(x, y)
    
    % Función que calcula el spline cúbico natural (S) de una serie de puntos
    % (x[i]), (y[i]) ∀ i = {0, 1, ..., N} mediante N polinomios de grado máximo 3
    % que describen el spline a trozos.
    % 
    %
    % • Condición de interpolación: 
    % S(x[i]) = y[i] ∀ i = {0, 1, ..., N}
    %
    % • Condición de continuidad:
    % S[i-1](x[i]) = S[i](x[i]) ∀ i = {1, ..., N-1}
    % 
    % • Condición de suavidad:      
    % S'[i-1](x[i]) = S'[i](x[i]) ∀ i = {1, ..., N-1}
    % 
    % • Condición de Spline Cubico Natural: 
    % S"(x[0]) = 0 & S"(x[N]) = 0
    
    plot(x, y, '*', 'Color', '#A2142F', 'LineWidth', 3)
    grid on; hold on;
    title('$Natural\,Cubic\,Spline$', 'Interpreter','latex', 'FontSize', 18)
    
    N = length(x)-1;
    H = diff(x);
    E = diff(y)./H;
    
    DiagonalPrincipal = diag(2*(H(1:N-1) + H(2:N)));
    DiagonalInferior  = diag(H(2:N-1), -1);
    DiagonalSuperior  = diag(H(2:N-1),  1);
    
    A = DiagonalPrincipal + DiagonalInferior + DiagonalSuperior;
    b = 6*diff(E');
    M = A\b;
    M0 = 0; Mn = 0;
    M = [M0 M' Mn];
    
    S = zeros(N, 4);
    for i=1:N
        
        S(i,1) = (M(i+1) - M(i))/(6*H(i));
        S(i,2) = (M(i)/2);
        S(i,3) = (E(i) - H(i)*(M(i+1) + 2*M(i))/6);
        S(i,4) = (y(i));
        
        xx = linspace(x(i), x(i+1));
        yy = S(i,1)*(xx - x(i)).^3 + S(i,2)*(xx - x(i)).^2 + S(i,3)*(xx - x(i)) + S(i,4);
        plot(xx, yy, LineWidth=2)
        
        limites(i,1) = "si x ∈ [" + num2str(x(i))+ ", " + num2str(x(i+1)) + "]"; %#ok<AGROW> 
        z(i,1) = "(x-" + x(i) + ")"; %#ok<AGROW> 
        
    end
    
    grid on, hold off
    i = (0:N)';
    
    variableNames = {'i', 'x','y','h[i]', 'f[x(i),x(i+1)]', 'S"(x[i])'};
    T1 = table(i, x', y', [H nan]', [E nan]', M', VariableNames=variableNames);
    disp(T1);
    
    variableNames = {'i','(x-x[i])','a','b','c', 'd', '[x[i], x[i+1]]'};
    T2 = table(i(1:end-1), z, S(:,1), S(:,2), S(:,3), S(:,4), limites, VariableNames=variableNames);
    disp(T2);
    
end

