function [T, xi] = PuntoFijoMAXITER(g, x0, maxIter)

    % Calcula el punto fijo (ρ) de la función g(x) tal que g(ρ)=ρ y f(ρ)=0
    
    z = [0 x0 g(x0) nan];
    
    for i = 1:maxIter
        xi = g(x0);
        error = abs(xi-x0);
        
        z  = [z; i xi g(xi) error]; %#ok<AGROW>
        x0 = xi;
    end
    
    variableNames = {'i','x[i]','g(x[i])','error'};
    T = table(z(:,1),z(:,2),z(:,3),z(:,4),VariableNames=variableNames);
    disp(T);
    
end

