function mychangeplot(Change,name,opt)
%Note: The 1st column is 'change in DR iterates'. The 2nd is 'change in
%shadow iterates'

Name=strcat('F_change_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
tt=length(Change);

semilogy(1:tt, Change(1:end,2),'Color',	[0.3010 0.7450 0.9330],'LineStyle','-');
hold on;
semilogy(1:tt, Change(1:end,1),'Color',[0 0.4470 0.7410],'LineStyle','-');


grid on
set(gca,'XMinorGrid','off')
set(gca,'YMinorGrid','off')

if length(opt)>1
    hold on
    %Make vertical lines 
    plot([opt(2),opt(2)],ylim,'r:',[opt(3),opt(3)],ylim,'r:',[opt(4),opt(4)],ylim,'r:')
end

le=legend('DR iterate','DR shadow');
set(le,'location','northeast','fontsize',10); %legend('boxoff');
axis square tight; set(gca,'box','on');
%xl=xlabel('Number of iterations');
%yl=ylabel('Relative Error'); 
%set([xl,yl],'fontsize',12);
set(findall(gca,'type','line'),'linewidth',1);
%Print locally
%print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\1D\',Name)); 
end
hold off
ylim([10e-10 10]);

