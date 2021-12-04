function [z, x] = JacobiTOL(A, b, x0, Tol)
    
    %JACOBI Metodo de Jacobi
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tj = (D) \ (L+U);  
    cj = (D) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tj)
    
        i = 0;
        z = [i x0' nan];
        error = 1;
        
        while error > Tol
            xi = Tj * x0 + cj;
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

