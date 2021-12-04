function [P] = PolinomioLagrange(x, y)
    
    
    n = length(x);
    P = zeros(1,n);
    
    for k=1:n
        
        num = poly(x([1:k-1,k+1:n]));   
        den = polyval(num, x(k));
        
        fprintf("\n\nTérmino %d de la sumatoria\n\n\n", k-1)
        
        fprintf('Los xi de arriba: \n');
        disp(x([1:k-1,k+1:n])');
        
        fprintf('El xk de abajo: \n');
        disp(x(k));
        
        fprintf('El producto de lo de arriba\n')
        disp(vpa(poly2sym(num), 5));
        
        fprintf('El producto de lo de abajo\n')
        disp(vpa(poly2sym(den), 5));
        
        fprintf('El lagrangiano desarrollado\n')
        disp(vpa(poly2sym(num)./poly2sym(den), 5));
        
        fprintf('El yk que multiplica el resultado\n');
        disp(y(k));
        
        fprintf('El término iésimo desarrollado\n');
        disp(vpa(y(k).*poly2sym(num)./poly2sym(den), 5));
        
        L = num/den;
        P = P + y(k)*L;
        
    end
    
end
