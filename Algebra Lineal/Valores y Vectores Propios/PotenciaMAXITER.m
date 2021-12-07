function [T] = PotenciaMAXITER(A, x0, maxIter)
    
    z = [0 nan nan x0'];
    
    for i=1:maxIter
        
        xi = A*x0;
        [~, k] = max(abs(xi));
        lambda = xi(k);
        v = (1/lambda)*xi;
        
        error = norm(v - x0)/norm(v);
        z = [z; i lambda error v']; %#ok<AGROW> 
        x0 = v;
        
    end
    
    varNames = {'i', 'eigenvalue', 'eigenvector', 'error'};
    T = table(z(:,1),z(:,2),z(:,4:end),z(:,3), VariableNames=varNames);
    disp(T);
    
end

