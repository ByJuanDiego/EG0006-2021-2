function [z, x] = GaussSeidelMAXITER(A, b, x0, maxIter)
    
    %GAUSSSEIDEL Metodo de Gauss-Seidel
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tgs = (D - L) \ (U);
    cgs = (D - L) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tgs)
        
        z = [x0']; %#ok<NBRAK> 
        
        for k = 1:maxIter
            xi = Tgs * x0 + cgs;
            z = [z; xi']; %#ok<AGROW> 
            x0 = xi;
        end
        
        x = xi;
    
    else
        z = [];
        x = [];
    end

end

