clc;
clear;

M1=2.^(2:7);

 error=[   1.0727e-01   6.2700e-03   3.0834e-03   3.2596e-03   3.3196e-03   3.3245e-03 % N=32
     1.0768e-01   6.2734e-03   7.1467e-04   8.6589e-04   8.8060e-04   8.8070e-04 %N=64
      1.0777e-01   6.4456e-03   3.9089e-04   2.1860e-04   2.2666e-04   2.2863e-04];  %N=128，theta=1/4


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
xlabel  ({'$M_1=M_2$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')          
ylabel  ({'$Numerical\; errors$'},'FontUnits','points','interpreter','latex','FontSize',15,'FontName','Times')    
legend('\tau=1/32','\tau=1/64','\tau=1/128','Location','southwest')
colormap(slanCM('rainbow'))