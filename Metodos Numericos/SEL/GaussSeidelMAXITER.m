function [T, xi] = GaussSeidelMAXITER(A, b, x0, maxIter)
    
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tgs = (D - L) \ (U);
    cgs = (D - L) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tgs)
        
        z = [0 nan x0']; 
        
        for k = 1:maxIter
            xi = Tgs * x0 + cgs;
            
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

