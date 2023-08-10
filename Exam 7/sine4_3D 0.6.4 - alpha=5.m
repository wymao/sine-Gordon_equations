clc;clear all;
m1 = 64;m2 = 64;m3 =64;n = 100;
xa=-30;xb=10;ya=-30;yb=10;za=-30;zb=10;ta=0;
alpha=5;beta=1;gamma=1;theta=1;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
h3 = (zb-za)/m3;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';
z = za:h3:zb; z = z';

u1 =SineG_3DADI2(xa,xb,ya,yb,za,zb,ta,4.1,m1,m2,m3,n,alpha,beta,gamma,theta);
u1 = sin(u1/2);
for l =1:m3+1
u1(1:m1+1,1:m1+1,l)=u1(1:m1+1,1:m1+1,l)';
end
p = patch(isosurface(x,y,z,u1,0.6));
isonormals(x,y,z,u1,p);
p.FaceColor = 'red';
p.EdgeColor = 'none';
daspect([1 1 1])
view(3);
camlight 
lighting gouraud
xlabel  ({'$x$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')        
ylabel  ({'$y$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
zlabel  ({'$z$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')   
title  ({'${\rm isosurfaces ~of ~\sin(u/2) = 0.6~ at~ t=4.1}$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')
set(gca,'XTick',-30:10:10);set(gca,'YTick',-30:10:10);set(gca,'ZTick',-30:10:10);
xlim([-30 10]);ylim([-30 10]);zlim([-13 10]);
grid on;

colormap(slanCM('rainbow'))