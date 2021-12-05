function [z, x] = GaussSeidelMAXITER(A, b, x0, maxIter)
    
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tgs = (D - L) \ (U);
    cgs = (D - L) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tgs)
        
        fprintf("\n    i         error     \t<xi>\n")
        
        z = [0 nan x0']; 
        

        for k = 1:maxIter
            xi = Tgs * x0 + cgs;

            error = norm(xi - x0)/norm(xi);
            z = [z; k error xi']; %#ok<AGROW> 
            x0 = xi;
        end
        
        disp(z)
        x = xi;
    
    else
        z = [];
        x = [];
    end

end

