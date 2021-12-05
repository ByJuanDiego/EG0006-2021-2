function [z, x] = GaussSeidelMAXITER(A, b, x0, maxIter)
    
    %GAUSSSEIDEL Metodo de Gauss-Seidel
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tgs = (D - L) \ (U);
    cgs = (D - L) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tgs)
        
        z = [0 x0' nan]; 
        
        for k = 1:maxIter
            xi = Tgs * x0 + cgs;
            error = norm(xi - x0)/norm(xi);
            z = [z; k xi' error]; %#ok<AGROW> 
            x0 = xi;
        end
        
        x = xi;
    
    else
        z = [];
        x = [];
    end

end

