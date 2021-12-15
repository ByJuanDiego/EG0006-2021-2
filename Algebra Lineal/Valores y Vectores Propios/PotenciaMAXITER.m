function [T, eigval, eigvec] = PotenciaMAXITER(A, x0, maxIter)
    
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
    
    z = [0 nan nan x0'];
    
    for i=1:maxIter
        
        xi = A*x0;
        [~, k] = max(abs(xi));
        eigval = xi(k);
        eigvec = (1/eigval)*xi;
        
        error = norm(eigvec - x0)/norm(eigvec);
        z = [z; i eigval error eigvec']; %#ok<AGROW> 
        x0 = eigvec;
        
    end
    
    varNames = {'i', 'eigenvalue', 'eigenvector', 'error'};
    T = table(z(:,1),z(:,2),z(:,4:end),z(:,3), VariableNames=varNames);
    disp(T);
    
end

