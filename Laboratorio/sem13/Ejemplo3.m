f=@(t,y)(2*y+exp(t))
syms y(t) t
y(t)=dsolve(diff(y,t)==2*y+exp(t),y(0)==1)
SolEx=inline(subs(y(t)),'t')
y0=1; h=0.1; a=0; b=1; t=[a:h:b]';
z=[t(1) y0 SolEx(t(1)) abs(SolEx(t(1))-y0) ]
k1=f(t(1),y0);
k2=f(t(1)+h/2,y0+h*k1/2);
k3=f(t(1)+h/2,y0+h*k2/2);
k4=f(t(1)+h,y0+h*k3);
y1=y0+(h/6)*(k1+2*k2+2*k3+k4);
z=[z;t(2) y1 SolEx(t(2)) abs(SolEx(t(2))-y1)]
k1=f(t(2),y1);
k2=f(t(2)+h/2,y1+h*k1/2);
k3=f(t(2)+h/2,y1+h*k2/2);
k4=f(t(2)+h,y1+h*k3);
y2=y1+(h/6)*(k1+2*k2+2*k3+k4);
z=[z;t(3) y2 SolEx(t(3)) abs(SolEx(t(3))-y2)]