function [z] = jacobi(A, b, x0, Maxiter)
%JACOBI Metodo de Jacobi
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A, 1);

Tj = inv(D) * (L + U); % matriz de iteracion de jacobi
cj = inv(D) * b;

rho = max(abs(eig(Tj))); %radio espectral
if rho < 1
    z = [x0'];
    for k = 1:Maxiter
        x1 = Tj * x0 + cj;
        z = [z; x1'];
        x0 = x1;
    end
else 
    z = [];
end

end
