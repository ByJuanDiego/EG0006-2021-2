function [Q, R, x] =  QR(A, b)
    
    % Factorización QR de Gram-Schmidt;
    
    [n,p] = size(A);
    Q = zeros(n,p);
    R = zeros(p,p);
    
    for k = 1:p
        
        fprintf("\n\npaso %d\n\n\n", k)
        
        Q(:,k) = A(:,k);
        
        for i = 1:k-1
            
            R(i,k) = Q(:,i)'*Q(:,k);
            fprintf("dot(Q(%d),*A(%d)) = r(%d, %d)\n", i, k, i, k);
            disp(R(i,k))
            
            Q(:,k) = Q(:,k) - R(i,k)*Q(:,i);
            fprintf("r(%d,%d)*Q(%d)\n", i, k, i);
            disp(R(i,k)*Q(:,i));
            
        end
        
        fprintf("q^(%d)\n", k);
        disp(Q(:,k))
        
        R(k,k) = norm(Q(:,k))';
        fprintf("r(%d, %d)\n", k, k);
        disp(R(k,k))
        
        Q(:,k) = Q(:,k)/R(k,k);
        fprintf("q(%d)\n", k);
        disp(Q(:,k))
        
        fprintf("\n\nse acabó el paso %d\n\n\n", k)
        
    end
    
    x = linsolve(R, Q'*b);
    
end