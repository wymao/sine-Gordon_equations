clc;
clear;

M1=2.^(2:6); 

 error=[  1.8801e-01   1.0987e-02   5.6187e-04   4.4969e-04   4.5635e-04 %N=128
     1.8807e-01   1.1186e-02   5.9839e-04   1.1192e-04   1.1728e-04   %N=256
     1.8808e-01   1.1236e-02   6.3943e-04   3.3949e-05   2.9470e-05];  %theta=0

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
legend('\tau=1/128','\tau=1/256','\tau=1/512','Location','southwest')
colormap(slanCM('rainbow'))