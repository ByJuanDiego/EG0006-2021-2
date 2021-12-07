function [T] = PotenciaTOL(A, x0, Tol)

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

T = table(z(:, 1), z(:, 2), z(:, 4:end), z(:, 3));
T.Properties.VariableNames{'Var1'} = 'i';
T.Properties.VariableNames{'Var2'} = 'eigenvalue';
T.Properties.VariableNames{'Var3'} = 'eigenvector';
T.Properties.VariableNames{'Var4'} = 'Error relativo';
disp(T);

end

