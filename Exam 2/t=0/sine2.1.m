clc;clear all;
m1 = 64;m2=64;n = 1000;xa=-14;xb=14;ya=-14;yb=14;ta=0;alpha=1;beta=1;theta=1/4;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';

%%
varphi = @(x,y) 4*(atan(exp(3-sqrt(x.^2+y.^2))));
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
 set(gca,'XTick',-14:7:14);set(gca,'YTick',-14:7:14);xlim([-14 14]);ylim([-14 14])

colormap(slanCM('rainbow'))