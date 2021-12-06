function [x] = SustitucionDirecta(L, b)
    % Sustitucion directa
    [~,n] = size(L);
    x = zeros(n,1);
    for k = 1:n
        x(k)=(b(k)-sum(L(k,1:k-1)*x(1:k-1)))/L(k,k);
    end
end
