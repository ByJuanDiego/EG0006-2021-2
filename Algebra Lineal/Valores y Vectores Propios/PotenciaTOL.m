function [z, v, lambda] = PotenciaTOL(A, x0, Tol)

i = 0;
error = 1;
z = [i nan nan x0'];

while error > Tol
    
    xi = A*x0;
    [~, k] = max(abs(xi));
    lambda = xi(k);
    v = (1/lambda)*xi;
    i = i + 1;
    error = norm(v - x0)/norm(v);
    z = [z; i lambda error v']; %#ok<AGROW> 
    x0 = v;
    
end

fprintf("\n    i        λ          Error     <v>\n")
disp(z)

end

