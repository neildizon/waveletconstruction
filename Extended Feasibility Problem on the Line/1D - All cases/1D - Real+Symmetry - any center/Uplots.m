function Out=Uplots(U,c,name,opt)
%Creates symbolic Matrix function U(xi) by reverse Fourier and plots
%the scaling function and wavelet against xi
[dim,~,M]=size(U);

A=zeros(dim,dim,M);
%Create Fourier Coefficients
for kk=1:M
    for nn=1:M
        A(:,:,kk)=A(:,:,kk)+U(:,:,nn)*exp(-2i*pi*(nn-1)*(kk-1)/M);
    end
end
%What is the bottom row of A? It gets ignored through the rest of the
%calculation, which is good because I don't think they mean anything.
A=A/M;
%Create symbolic function using above coefficients
Mx=c*M;
M0=zeros(1,Mx+1);
M1=zeros(1,Mx+1);
for ll=1:Mx+1
for kk=1:M
    M0(ll)=M0(ll)+A(1,1,kk)*exp(2i*pi*(kk-1)*(ll-1)/(Mx));
    M1(ll)=M1(ll)+A(1,2,kk)*exp(2i*pi*(kk-1)*(ll-1)/(Mx));
end
end

%Create plots for M0, M1
Out=[M0,M1];

xi=0:1/Mx:1;



Name=strcat('F_m0_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); hold on;
plot(xi,real(M0),'Color',[0 0.4470 0.7410],'LineStyle','--');
hold on
plot(xi,imag(M0),'Color',[0 0.4470 0.7410],'LineStyle','-.');
plot(xi,abs(M0),'Color',[0 0.4470 0.7410],'LineStyle','-'); 
hold off
le=legend('$\Re(m_0)$', '$\Im(m_0)$','$|m_0|$)','Interpreter','latex','FontSize',12);
axis square tight; set(gca,'box','on');
set(le,'location','south','fontsize',12); %legend('boxoff');
grid on


xl=xlabel('');
yl=ylabel(''); 
set([xl,yl],'fontsize',12);
set(findall(gca,'type','line'),'linewidth',1);
%Print locally
print('-dpng',strcat('pics\',Name));
%Print to TeX folder
if opt==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\1D\',Name)); 
end


% Name=strcat('F_m1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); hold on;
% plot(xi,real(M1),'b-',xi,imag(M1),'c-',xi,abs(M1),'k-'); 
% le=legend('Real(m_1)', 'Imag(m_1)','Abs(m_1)');
% axis square tight; set(gca,'box','on');
% set(le,'location','southwest','fontsize',12); %legend('boxoff');
% xl=xlabel('');
% yl=ylabel(''); 
% set([xl,yl],'fontsize',12);
% set(findall(gca,'type','line'),'linewidth',1);
% %Print locally
% print('-dpng',strcat('pics\',Name));
% %Print to TeX folder
% if opt==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\1D\',Name)); 
% end



    
    
    
    