clc;
clear;

M1=2.^(2:7); 

 error=[  1.4582e-01   4.0842e-02   4.7454e-02   4.8225e-02   4.8402e-02   4.8412e-02
     1.7752e-01   5.2204e-03   9.9676e-03   1.0874e-02   1.0929e-02   1.0932e-02
      1.8540e-01   8.7438e-03   2.2209e-03   2.8761e-03   2.8991e-03   2.9004e-03];%theta=1

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