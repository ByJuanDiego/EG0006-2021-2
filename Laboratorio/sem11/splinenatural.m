function [S]=splinenatural(X,Y)

    N=length(X)-1;
    
    H=diff(X); 
    E=diff(Y)./H;
    
    diagprinc = 2*(H(1:N-1)+H(2:N)); 
    diagsupinf = H(2:N-1);
    
	g0=0; 
    gn=0;
    
	A=diag(diagprinc)+diag(diagsupinf,1)+diag(diagsupinf,-1);
	b=6*diff(E'); g=A\b;
	g=[g0 g' gn];
    
    disp(A);
    disp(b);
    
    for i=1:N
        
        S(i,1)=(g(i+1)-g(i))/(6*H(i));
        S(i,2)=g(i)/2;
        S(i,3)= E(i)-H(i)*(g(i+1)+2*g(i))/6;
        S(i,4)=Y(i);
        xx=linspace(X(i),X(i+1),10000);
        yy=S(i,1)*(xx-X(i)).^3+S(i,2)*(xx-X(i)).^2+S(i,3)*(xx-X(i))+S(i,4);
        
        plot(xx, yy), hold on
        
    end
    
	grid on, hold off
    
end