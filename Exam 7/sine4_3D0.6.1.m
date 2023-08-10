clc;clear all;
m1 = 64;m2 = 64;m3 =64;n = 100;
xa=-30;xb=10;ya=-30;yb=10;za=-30;zb=10;ta=0;
alpha=1;beta=1;gamma=1;theta=1;
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
h3 = (zb-za)/m3;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';
z = za:h3:zb; z = z';
%%
varphi = @(x,y,z) 4*(atan(exp((4-sqrt((x+3).^2+(y+3).^2+(z+3).^2))./0.436)))+4*(atan(exp((4-sqrt((x+17).^2+(y+3).^2+(z+3).^2))./0.436)))+...
     4*(atan(exp((4-sqrt((x+3).^2+(y+17).^2+(z+3).^2))./0.436)))+4*(atan(exp((4-sqrt((x+17).^2+(y+17).^2+(z+3).^2))./0.436)));
   
  for i=1:m1+1
     for j=1:m2+1
       for l=1:m3+1
         u(i,j,l) = varphi(x(i),y(j),z(l));
         end
     end
  end
 
 u = sin(u/2);
 p = patch(isosurface(x,y,z,u,0.6));
 isonormals(x,y,z,u,p);
 p.FaceColor = 'red';
 p.EdgeColor = 'none';
 daspect([1 1 1])
 view(3);
 camlight 
 lighting gouraud
 
 xlabel  ({'$x$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')           
 ylabel  ({'$y$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')   
 zlabel  ({'$z$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
 title  ({'${\rm isosurfaces ~of ~\sin(u/2) = 0.6~ at~ t=0}$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')
 set(gca,'XTick',-30:10:10);set(gca,'YTick',-30:10:10);set(gca,'ZTick',-30:10:10);
 xlim([-30 10]);ylim([-30 10]);zlim([-13 10]);
 grid on;

