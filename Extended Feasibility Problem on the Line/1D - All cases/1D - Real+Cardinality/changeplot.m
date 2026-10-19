function changeplot(Change,name,opt)

Name=strcat('F_change_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
tt=length(Change);
semilogy(1:tt, Change(1:end,1),'k-',1:tt,Change(1:end,2),'b-'); 
if length(opt)>1
    hold on
    %Make vertical lines 
    plot([opt(2),opt(2)],ylim,'r:',[opt(3),opt(3)],ylim,'r:',[opt(4),opt(4)],ylim,'r:')
end
le=legend('Direct Measure', 'Change each iterate');
set(le,'location','northeast','fontsize',12); %legend('boxoff');
axis square tight; set(gca,'box','on');
xl=xlabel('');
yl=ylabel(''); 
set([xl,yl],'fontsize',12);
set(findall(gca,'type','line'),'linewidth',1);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\1D\',Name)); 
end


