clc;clear all;
m1 = 64;m2=64;n = 1000;xa=-14;xb=14;ya=-14;yb=14;ta=0;alpha=1;beta=1;theta=1/4;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';

%%
 u2 =SineG_2DADI3(xa,xb,ya,yb,ta,8,m1,m2,n,alpha,beta,theta);
 u2 = sin(u2/2);
 mesh(x,y,u2');
 shading interp;
 xlabel  ({'$x$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')       
 ylabel  ({'$y$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
 zlabel  ({'$\sin(u/2)$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
 title  ({'$t=8$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')
 set(gca,'XTick',-14:7:14);set(gca,'YTick',-14:7:14);xlim([-14 14]);ylim([-14 14])


colormap(slanCM('rainbow'))