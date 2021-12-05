function [z, x] = GaussSeidelTOL(A, b, x0, Tol)
    
    %GAUSSSEIDEL Metodo de Gauss-Seidel
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tgs = (D - L) \ (U);
    cgs = (D - L) \ (b);
    
    if MatrizDominante(A) || RadioEspectral(Tgs)
        
        fprintf("\n    i         error     \t<xi>\n")
        i = 0;
        z = [i nan x0'];
        error = 1;
        
        while error > Tol
            xi = Tgs * x0 + cgs;
            i = i + 1;
            error = norm(xi - x0)/norm(xi);
            z = [z; i error xi']; %#ok<AGROW> 
            x0 = xi;
        end
        
        disp(z);
        x = xi;
    
    else
        z = [];
        x = [];
    end

end

