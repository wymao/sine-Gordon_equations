clc;
clear;

M1=2.^(2:7);

error=[  9.9881e-02   1.0228e-02   1.3272e-02   1.3731e-02   1.3813e-02   1.3814e-02 %N=16
  1.0582e-01   5.5917e-03   3.5459e-03   3.6678e-03   3.7090e-03   3.7110e-03 %N=32
  1.0730e-01   6.0500e-03   7.9233e-04   9.2392e-04   9.4347e-04   9.4069e-04];%N=64，theta=1/2

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