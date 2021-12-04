function [z] = PuntoFijoTOL(g, x0, Tol)
    
    z = [0 x0 g(x0) nan];
    i = 0;
    fprintf("\n    i         x         g(x)      error \n")
    
    error = 1;
    while error > Tol
        x1 = g(x0);
        error = abs((x1-x0)/x1);
        i = i + 1;
        z  = [z; i x1 g(x1) error]; %#ok<AGROW>
        x0 = x1;
    end
    
    disp(z)
    
end
