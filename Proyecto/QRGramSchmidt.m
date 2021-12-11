function [P, Q, R] =  QRGramSchmidt(x, y, grado)
    
    % Factorización QR de Gram-Schmidt;
    % Q*R = A, 
    % Además, resuelve el sistema Q*R*x = y
    % y retorna los coeficientes del polinomio
    
    A = MinimosCuadrados(x, grado);
    
    [n,p] = size(A);
    Q = zeros(n,p);
    R = zeros(p,p);
    
    for k = 1:p
        
        Q(:,k) = A(:,k);
        
        for i = 1:k-1
            
            R(i,k) = Q(:,i)'*Q(:,k);
            
            Q(:,k) = Q(:,k) - R(i,k)*Q(:,i);
            
        end
        
        R(k,k) = norm(Q(:,k))';
        Q(:,k) = Q(:,k)/R(k,k);
        
    end
    
    % Q*R*x = b
    % R*x = Q'*b
    
    P = fliplr((R \ Q'*y')');
    
end