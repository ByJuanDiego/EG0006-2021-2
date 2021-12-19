function [Q, R] =  QRGramSchmidt(A)
    
    % Factorización QR de Gram-Schmidt;
    % Q*R = A
    % Q^(t) = Q^(-1)
    
    [n,p] = size(A);
    Q = zeros(n,p);
    R = zeros(p,p);
    
    for k = 1:p
        
        fprintf("\n\n\npaso %d\n\n\n", k)
        
        Q(:,k) = A(:,k);
        
        for i = 1:k-1
            
            R(i,k) = Q(:,i)'*Q(:,k);
            fprintf("dot(q(%d),a(%d)) = r(%d, %d)\n", i, k, i, k);
            disp(R(i,k))
            
            Q(:,k) = Q(:,k) - R(i,k)*Q(:,i);
            fprintf("r(%d,%d)*q(%d)\n", i, k, i);
            disp(R(i,k)*Q(:,i));
            
        end
        
        fprintf("q^(%d)\n", k);
        disp(Q(:,k))
        
        R(k,k) = norm(Q(:,k))';
        fprintf("r(%d,%d)\n", k, k);
        disp(R(k,k))
        
        Q(:,k) = Q(:,k)/R(k,k);
        fprintf("q(%d)\n", k);
        disp(Q(:,k))
        
    end
    
end