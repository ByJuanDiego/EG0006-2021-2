function [T, lambda, v] = PotenciaTOL(A, x0, Tol)
    
    % Converge al valor propio dominante (λ):
    % 
    % A*x = λ*x
    % A*x - λ*x = 0
    % A - λ*I = 0
    % 
    % y al vector propio dominante (v)
    % 
    % A*v = λ*v
    %
    
    i = 0;
    error = 1;
    z = [i nan nan x0'];
    
    while error > Tol
        
        xi = A*x0;
        [~, k] = max(abs(xi));
        lambda = xi(k);
        v = (1/lambda)*xi;
        i = i + 1;
        error = norm(v - x0)/norm(v);
        z = [z; i lambda error v']; %#ok<AGROW> 
        x0 = v;
        
    end
    
    varNames = {'i', 'eigenvalue', 'eigenvector', 'error'};
    T = table(z(:,1), z(:,2), z(:,4:end), z(:,3), VariableNames=varNames);
    disp(T);
    
end

