clc;clear all;
m1 = 64;m2=64;n = 1000;xa=-7;xb=7;ya=-7;yb=7;ta=0;alpha=1;beta=1;theta=1/3;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';

%%
varphi = @(x,y) 4*(atan(2*sech(0.866*(sqrt((x-y).^2/3+(x+y).^2/2)))));
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
set(gca,'XTick',-7:7:7);set(gca,'YTick',-7:7:7);xlim([-7 7]);ylim([-7 7])

colormap(slanCM('rainbow'))