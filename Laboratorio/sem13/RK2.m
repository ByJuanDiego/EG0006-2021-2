function [z]=RK2(f,a,b,y0,h)

    syms y(x) x
    y(x)=dsolve(diff(y,x)==f(x,y),y(a)==y0);
    pretty(y)
    
    SolEx=inline(subs(y(x)),'x');
    
    n = (b-a)/h;
    yy = zeros(n+1,1);    
    yy(1) = y0;
    
    x = [a:h:b]';
    
    K1 = zeros(n+1,1);
    K1(1) = f(a, y0);
    
    K2 = zeros(n+1,1);
    K2(1) = f(a+h, y0+K1(1)*h);
    
    z = [0 x(1) yy(1) SolEx(x(1)) abs(SolEx(x(1))-yy(1)) K1(1) K2(1)];
    fprintf("\n    i          xi       yyi       yi        Error    K1        K2\n")
    
    for i = 1:n
        
        yy(i+1) = yy(i) + h/2*(K1(i) + K2(i));
        
        K1(i+1) = f(x(i+1), yy(i+1));
        K2(i+1) = f(x(i+1)+h, yy(i+1)+K1(i+1)*h);
       
        z=[z; i x(i+1) yy(i+1) SolEx(x(i+1)) abs(SolEx(x(i+1))-yy(i+1)) K1(i+1) K2(i+1)];
        
    end
    
    disp(z);
    
end

