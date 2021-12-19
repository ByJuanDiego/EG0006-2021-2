function [T, xi] = JacobiTOL(A, b, x0, Tol)
    
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tj = (D) \ (L+U);  
    cj = (D) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tj)
        
        i = 0;
        z = [i nan x0'];
        error = 1;
        
        while error > Tol
            xi = Tj * x0 + cj;
            i = i + 1;
            error = norm(xi - x0, Inf)/norm(xi, Inf);
            z = [z; i error xi']; %#ok<AGROW> 
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

