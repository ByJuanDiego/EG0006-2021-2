x = [1 3 10 16]';
y = [4 7 12 8]';
g2 = polyfit(x,y,2);

xx = [1:0.01:16];
yy1= polyval(g2,xx);

plot(xx,yy1,'r',x,y,'ob');

%Otra forma

M=[x.^2 x ones(4,1)];
u=inv(M'*M)*M'*y;
disp(u);
