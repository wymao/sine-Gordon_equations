clc;
clear;

M1=2.^(2:7);

 error=[ 8.9349e-02   1.6139e-02   2.0345e-02   2.0602e-02   2.0730e-02   2.0731e-02 %N=16
      1.0296e-01   4.2241e-03   4.5491e-03   4.7389e-03   4.7459e-03   4.7463e-03 %N=32
     1.0656e-01   5.6016e-03   9.6496e-04   1.0906e-03   1.1120e-03   1.1121e-03];%%N=64，theta=1

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
legend('\tau=1/16','\tau=1/32','\tau=1/64','Location','southwest')
colormap(slanCM('rainbow'))