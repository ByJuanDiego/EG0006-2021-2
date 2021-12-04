function [z, x] = GaussSeidelTOL(A, b, x0, Tol)
    
    %GAUSSSEIDEL Metodo de Gauss-Seidel
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tgs = (D - L) \ (U);
    cgs = (D - L) \ (b);
    
    if MatrizDominante(A) || RadioEspectral(Tgs)
        
        i = 0;
        z = [i x0' nan];
        error = 1;
        
        while error > Tol
            xi = Tgs * x0 + cgs;
            i = i + 1;
            error = norm(xi - x0)/norm(xi);
            z = [z; i xi' error]; %#ok<AGROW> 
            x0 = xi;
        end
        
        x = xi;
    
    else
        z = [];
        x = [];
    end

end

