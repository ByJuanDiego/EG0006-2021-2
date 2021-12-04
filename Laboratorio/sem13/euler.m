function [z]=euler(f,a,b,y0,h)

    syms y(x) x
    y(x)=dsolve(diff(y,x)==f(x,y),y(a)==y0);
    pretty(y)
    SolEx=inline(subs(y(x)),'x');
    
    n = (b-a)/h;
    yy = zeros(n+1,1);
    yy(1) = y0;
    x = [a:h:b]';
    z = [0 x(1) yy(1) SolEx(x(1)) abs(SolEx(x(1))-yy(1))];
    
    fprintf("\n    i          xi       yyi       yi        Error\n")
    for i = 1:n 
        yy(i+1) = yy(i) + h*f(x(i),yy(i));
        z = [z; i x(i+1) yy(i+1) SolEx(x(i+1)) abs(SolEx(x(i+1))-yy(i+1)) ];
    end
    disp(z);
    
end
