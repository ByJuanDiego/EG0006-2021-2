function [Ea,nb] = GaussSinPivoteo(A,b)
    
    % resolucion de un sistema de ecuaciones por medio de la eliminacion gaussiana
    [~,n]=size(A);
    Aa = [A b];
    
    for k=1:n-1
        pivo = Aa(k,k);
        for j=k+1:n
            mjk = Aa(j,k)/pivo;
            Aa(j,:) = Aa(j,:)-mjk*Aa(k,:);
        end
    end
    
    Ea=Aa(:,1:n);
    nb=Aa(:,n+1);

end