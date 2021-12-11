function [M] = MinimosCuadrados(x, grado)
    
    n = length(x);
    grados = grado + 1;
    
    M = zeros(n,grados);
    M(:,1) = ones(n,1);
    
    for i = 2:grados
        M(:,i) = x.^(i-1);
    end

end
