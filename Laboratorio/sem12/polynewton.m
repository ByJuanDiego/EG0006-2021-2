function p=polynewton(x,y)

  M=tabladif(x,y);
  
  n=length(x);
  b=M(1,2:end);
  p=b(1);
  
  for k=2:n
    p=[0 p]+b(k)*poly(x(1:k-1));
  end
  
end
