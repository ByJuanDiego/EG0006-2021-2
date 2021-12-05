function [z, x] = JacobiTOL(A, b, x0, Tol)
    
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tj = (D) \ (L+U);  
    cj = (D) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tj)
    
        fprintf("\n    i         error     \t<xi>\n")
        i = 0;
        z = [i nan x0'];
        error = 1;
        
        while error > Tol
            xi = Tj * x0 + cj;
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

