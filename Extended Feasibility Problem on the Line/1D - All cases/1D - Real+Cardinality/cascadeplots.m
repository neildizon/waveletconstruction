function cascadeplots(U,c,name,opt)
if opt==0
    opt=[0,0];
end
%Convert a U sequence back to a scaling mask A (and B for the wavelet)
[A,B]=U2A(U);
%Solve the eigenvalue problem to find Phi at integer points

%[Phi,~,X]=wavefun('rw1',1);
[Phi,X]=cascadeskeleton(A);
%Then iterate the cascade 7 times
[Phi,X]=cascPhi(Phi,X,A,c);
%Then create the wavelet based on Phi and the mask B
[Psi,X]=cascPsi(Phi,X,B);
length(Phi);
%Create plots of scaling function and wavelet

Name=strcat('F_phi_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'Color',[0 0.4470 0.7410],'LineStyle','--');
grid on
%grid minor
if opt(2)==1
    hold on
    plot(X,imag(Phi),'Color',[0 0.4470 0.7410],'LineStyle','-.');
    plot(X,abs(Phi),'Color',[0 0.4470 0.7410],'LineStyle','-');
    le=legend('$\Re(\varphi$)', '$\Im(\varphi$)','$|\varphi|$','Interpreter','latex','FontSize',12);
    set(le,'fontsize',12,'location','northeast');
end
axis square tight; set(gca,'box','on');
xl=xlabel('');
yl=ylabel(''); 
set([xl,yl],'fontsize',12);
set(findall(gca,'type','line'),'linewidth',1);
%Print locally
print('-dpng',strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\1D\',Name)); 
end



Name=strcat('F_psi_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Psi),'Color',[0 0.4470 0.7410],'LineStyle','--');
grid on
if opt(2)==1
    hold on
    plot(X,imag(Psi),'Color',[0 0.4470 0.7410],'LineStyle','-.');
    plot(X,abs(Psi),'Color',[0 0.4470 0.7410],'LineStyle','-');
    le=legend('$\Re(\psi$)', '$\Im(\psi$)','$|\psi|$','Interpreter','latex','FontSize',12);
    set(le,'fontsize',12,'location','northeast');
end
axis square tight; set(gca,'box','on');
xl=xlabel('');
yl=ylabel(''); 
set([xl,yl],'fontsize',12);
set(findall(gca,'type','line'),'linewidth',1);
%Print locally
print('-dpng',strcat('pics\',Name));
%Print to TeX folder
%max(Psi)
%min(real(Psi))

if opt(1)==1
    print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\1D\',Name)); 
end





% 
% %Now we create the tensor product
% [X1,X2]=meshgrid(X);
% tPsi0=Phi'*Phi;
% tPsi1=Phi'*Psi;
% tPsi2=Psi'*Phi;
% tPsi3=Psi'*Psi;
% 
% %Make surfaces for the tensor product
% figure(2)
% subplot(2,2,1)
% surf(X1,X2,real(tPsi0));title('Phi-The Scaling Function')
% subplot(2,2,2)
% surf(X1,X2,real(tPsi1));title('Psi1-The First Wavelet')
% subplot(2,2,3)
% surf(X1,X2,real(tPsi2));title('Psi2-The Second Wavelet')
% subplot(2,2,4)
% surf(X1,X2,real(tPsi3));title('Psi3-The Third Wavelet')


