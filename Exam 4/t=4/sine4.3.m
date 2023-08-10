clc;clear all;
m1 = 64;m2=64;n = 100;xa=-30;xb=10;ya=-21;yb=7;ta=0;alpha=1;beta=1;theta=3/4;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';

%%

 u1 =SineG_2DADI3(xa,xb,ya,yb,ta,4,m1,m2,n,alpha,beta,theta);
 u1 = sin(u1'/2);
 mesh(x,y,u1);
 shading interp;
 xlabel  ({'$x$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')             
 ylabel  ({'$y$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
 zlabel  ({'$\sin(u/2)$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
 title  ({'$t=4$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')
set(gca,'XTick',-30:10:10);set(gca,'YTick',-21:7:7);xlim([-30 10]);ylim([-21 7])


colormap(slanCM('rainbow'))