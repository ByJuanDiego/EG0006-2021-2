function d=FactorR2(x,y)
    n=length(x);
    g1=polyfit(x,y,1);
    yis=polyval(g1,x);
    ym=sum(y)/n;
    d=sum((yis-ym).^2)/sum((y-ym).^2);
end
