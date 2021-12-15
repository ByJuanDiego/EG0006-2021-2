function [T, eigval, eigvec] = PotenciaTOL(A, x0, Tol)
    
    % Converge al valor propio dominante (eigval):
    % 
    % A*x = eigval*x
    % A*x - eigval*x = 0
    % A - eigval*I = 0
    % 
    % y al vector propio dominante (eigvec)
    % 
    % A*eigvec = eigval*eigvec
    %
    
    i = 0;
    error = 1;
    z = [i nan nan x0'];
    
    while error > Tol
        
        xi = A*x0;
        [~, k] = max(abs(xi));
        eigval = xi(k);
        eigvec = (1/eigval)*xi;
        i = i + 1;
        error = norm(eigvec - x0)/norm(eigvec);
        z = [z; i eigval error eigvec']; %#ok<AGROW> 
        x0 = eigvec;
        
    end
    
    varNames = {'i', 'eigenvalue', 'eigenvector', 'error'};
    T = table(z(:,1), z(:,2), z(:,4:end), z(:,3), VariableNames=varNames);
    disp(T);
    
end

