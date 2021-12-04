x=[0 3 4 7]'
y=[5 2 6 9]'
M=[x.^3 x.^2 x ones(4,1)]
M=vander(x)
p=M\y % inv(M)*y

%  Otra forma, utilizando el comando polyfit de Matlab
p1=polyfit(x,y,3)