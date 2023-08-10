clc;clear all;
m1 = 64;m2=64;n = 1000;xa=-7;xb=7;ya=-7;yb=7;ta=0;alpha=1;beta=1;theta=1/3;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';

%% 
 u3 =SineG_2DADI3(xa,xb,ya,yb,ta,11.2,m1,m2,n,alpha,beta,theta);
 u3 = sin(u3'/2);
 contour(x,y,u3, 20, 'LineWidth', 0.8);
 xlabel  ({'$x$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')          
 ylabel  ({'$y$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')  
 title   ({'$\sin(u/2),t=11.2$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')
set(gca,'XTick',-7:7:7);set(gca,'YTick',-7:7:7);xlim([-7 7]);ylim([-7 7])

colormap(slanCM('rainbow'))