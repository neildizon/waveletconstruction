function plotPDRTWO(Change,CChange,name,opt)
%Note: The 1st column is 'change in DR iterates'. The 2nd is 'change in
%shadow iterates'

Name=strcat('F_change_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
tt=length(Change);
ttt=length(CChange);

semilogy(1:tt, Change(1:end,1),'Color','k','LineStyle','-');
hold on;
semilogy(1:ttt, CChange(1:end,1),'Color',[0.4940 0.1840 0.5560],'LineStyle','-', 'LineWidth',1);

grid on
if length(opt)>1
    hold on
    %Make vertical lines 
    plot([opt(2),opt(2)],ylim,'r:',[opt(3),opt(3)],ylim,'r:',[opt(4),opt(4)],ylim,'r:')
end
title('Product DR vs 2 Constraint-reduced DR')
le=legend('P-DR Relative Err','C-DR Relative Err');
set(le,'location','northeast','fontsize',10); %legend('boxoff');
axis square tight; set(gca,'box','on');
xl=xlabel('Iterates');
yl=ylabel('Relative Error'); 
set([xl,yl],'fontsize',12);
set(findall(gca,'type','line'),'linewidth',1);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\1D\',Name)); 
end
hold off
ylim([10e-10 10]);
grid off; grid on;
