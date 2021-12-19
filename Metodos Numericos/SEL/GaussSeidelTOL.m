function [T, xi] = GaussSeidelTOL(A, b, x0, Tol)
    
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tgs = (D - L) \ (U);
    cgs = (D - L) \ (b);
    
    if MatrizDominante(A) || RadioEspectral(Tgs)
        
        i = 0;
        z = [i nan x0'];
        error = 1;
        
        while error > Tol
            xi = Tgs * x0 + cgs;
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

