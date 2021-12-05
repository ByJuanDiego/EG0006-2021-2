function [z, x] = JacobiMAXITER(A, b, x0, maxIter)
    
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tj = (D) \ (L + U); 
    cj = (D) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tj)
        
        fprintf("\n    i         error     \t<xi>\n")

        z = [0 x0' nan];
        
        for k = 1:maxIter
            xi = Tj * x0 + cj;
            error = norm(xi - x0)/norm(xi);
            z = [z; k error xi']; %#ok<AGROW> 
            x0 = xi;
        end
        
        disp(z);
        x = xi;
    
    else
        z = [];
        x = [];
    end
    
end