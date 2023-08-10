clc;
clear;

M1=2.^(2:7);

error=[  1.0782e-01   6.5064e-03   3.9295e-04   4.8024e-05   5.4757e-05   5.5605e-05 % N=256
      1.0780e-01   6.5069e-03   3.9015e-04   2.7732e-05   1.3585e-05   1.3997e-05 % N=512
      1.0780e-01   6.5070e-03   3.9050e-04   2.4640e-05   3.2061e-06   3.5011e-06]; %  N=1024，theta=0

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
legend('\tau=1/256','\tau=1/512','\tau=1/1024','Location','southwest')
colormap(slanCM('rainbow'))