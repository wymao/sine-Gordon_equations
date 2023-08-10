clc;
clear;

M1=2.^(2:7); 

 error=[ 1.8453e-01   7.2739e-03   6.9363e-03   7.2246e-03   7.3020e-03   7.2785e-03
   1.8719e-01   9.8530e-03   1.7090e-03   1.8530e-03   1.8856e-03   1.8909e-03
  1.8786e-01   1.0890e-02   4.7360e-04   4.6726e-04   4.8024e-04   4.8252e-04];%theta=1/4

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
legend('\tau=1/32','\tau=1/64','\tau=1/128','Location','southwest')
colormap(slanCM('rainbow'))