clc;
clear;

M1=2.^(2:7); 

error=[ 1.6512e-01   2.7535e-02   3.0832e-02   3.1346e-02   3.1383e-02   3.1392e-02
1.8222e-01   6.1872e-03   7.7101e-03   8.1772e-03   8.1518e-03   8.1496e-03
 1.8659e-01   9.4877e-03   1.8281e-03   2.0973e-03   2.1805e-03   2.1868e-03];%theta=1/2

%% plot   ===loglog===
set(gcf,'Position',[100 100 400 480]);
figure_FontSize=8;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);

loglog(M1,error(1,:),'g-o',...
    'MarkerSize',5,...
    'Markerfacecolor','g',...
    'MarkerEdgeColor','g')
hold on
  loglog(M1,error(2,:),'r-^',...
    'MarkerSize',5,...
    'Markerfacecolor','r',...
    'MarkerEdgeColor','r')
hold on
 loglog(M1,error(3,:),'b-v',...
    'MarkerSize',5,...
    'Markerfacecolor','b',...
    'MarkerEdgeColor','b')
grid on
xlim([3 400])
xlabel  ({'$M_1=M_2=M_3$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')        
ylabel  ({'$Numerical\; errors$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')  
legend('\tau=1/16','\tau=1/32','\tau=1/64','Location','southwest')
colormap(slanCM('rainbow'))