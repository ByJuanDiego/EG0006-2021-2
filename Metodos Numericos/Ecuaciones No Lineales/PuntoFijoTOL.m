function [T, xi] = PuntoFijoTOL(g, x0, Tol)

    % Calcula el punto fijo (ρ) de la función g(x) tal que g(ρ)=ρ y f(ρ)=0
    
    i = 0;
    z = [i x0 g(x0) nan];
    error = 1;
    
    while error > Tol
        xi = g(x0);
        error = abs((xi-x0)/xi);
        i = i + 1;
        z  = [z; i xi g(xi) error]; %#ok<AGROW>
        x0 = xi;
    end
    
    variableNames = {'i','x[i]','g(x[i])','error'};
    T = table(z(:,1),z(:,2),z(:,3),z(:,4),VariableNames=variableNames);
    disp(T);
    
end
