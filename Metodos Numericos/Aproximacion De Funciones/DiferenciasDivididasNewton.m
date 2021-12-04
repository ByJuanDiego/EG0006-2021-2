function [M] = DiferenciasDivididasNewton(x,y)
    
    n=length(x);
    M=zeros(n);
    M(1:n,1)=y;
    
    for k=1:n-1
        Delta_x=x(k+1:n)-x(1:n-k);
        Delta_y=diff(y)./Delta_x;
        M(1:n-k,k+1)=Delta_y;   
        y=Delta_y;
    end
  
    M=[x M];
    
    fprintf("\n\n");
    disp(M);
    
end

