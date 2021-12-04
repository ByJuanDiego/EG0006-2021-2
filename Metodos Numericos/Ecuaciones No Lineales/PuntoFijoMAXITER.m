function [z] = PuntoFijoMAXITER(g, x0, maxIter)
    
    z = [0 x0 g(x0) nan];
    
    fprintf("\n    i         x         g(x)      error \n")
    
    
    for k = 1:maxIter
        x1 = g(x0);
        error = abs(x1-x0);
        
        z  = [z; k x1 g(x1) error]; %#ok<AGROW>
        x0 = x1;
    end
    
    disp(z)
    
end