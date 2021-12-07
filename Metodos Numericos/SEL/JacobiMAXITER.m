function [T, xi] = JacobiMAXITER(A, b, x0, maxIter)
    
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tj = (D) \ (L + U); 
    cj = (D) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tj)
        
        z = [0 x0' nan];
        
        for k = 1:maxIter
            xi = Tj * x0 + cj;
            error = norm(xi - x0)/norm(xi);
            z = [z; k error xi']; %#ok<AGROW> 
            x0 = xi;
        end
        
        variableNames = {'i','<x[i]>','error'};
        T = table(z(:,1),z(:,3:end),z(:,2), VariableNames=variableNames);
        disp(T);
        
    else
        T = table();
        xi = [];
    end
    
end