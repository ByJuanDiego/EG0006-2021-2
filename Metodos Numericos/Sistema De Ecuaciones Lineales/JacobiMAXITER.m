function [z, x] = JacobiMAXITER(A, b, x0, maxIter)
    
    %JACOBI Metodo de Jacobi
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A, 1);
    
    Tj = (D) \ (L + U); 
    cj = (D) \ (b); 
    
    if MatrizDominante(A) || RadioEspectral(Tj)
        
        z = [x0']; %#ok<NBRAK>
        
        for k = 1:maxIter
            xi = Tj * x0 + cj;
            z = [z; xi']; %#ok<AGROW> 
            x0 = xi;
        end
        
        x = xi;
    
    else
        z = [];
        x = [];
    end
    
end