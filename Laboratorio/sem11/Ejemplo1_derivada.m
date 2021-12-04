%clc
%syms x

%f=inline('x^2*log(x)')
%Der01=diff(f(x))
%Der01_value=vpa(subs(Der01,2),15)
