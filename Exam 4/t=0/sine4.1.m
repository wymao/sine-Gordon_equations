clc;clear all;
m1 = 64;m2=64;n = 100;xa=-30;xb=10;ya=-21;yb=7;ta=0;alpha=1;beta=1;theta=3/4;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';

%%
varphi = @(x,y) 4*(atan(exp((4-sqrt((x+3).^2+(y+7).^2))./0.436)))+4*(atan(exp((4-sqrt((x+17).^2+(y+7).^2))./0.436)));
for i= 1:m1+1
    for j=1:m2+1
        u(i,j) = varphi(x(i),y(j));
    end
end

 u = sin(u/2);
 mesh(x,y,u');
 shading interp;
 xlabel  ({'$x$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')        
 ylabel  ({'$y$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
 zlabel  ({'$\sin(u/2)$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
 title  ({'$t=0$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')
 set(gca,'XTick',-30:10:10);set(gca,'YTick',-21:7:7);xlim([-30 10]);ylim([-21 7])

colormap(slanCM('rainbow'))