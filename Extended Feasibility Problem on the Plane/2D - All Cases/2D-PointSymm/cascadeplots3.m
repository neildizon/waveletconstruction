function cascadeplots3(U,c,name,opt)
%makes 1D plots of 2D functions 
[~,~,M,~]=size(U);

if opt==0
    opt=[0,0];
end
%Convert a U sequence back to a scaling mask A (and B for the wavelet)

[A,B1,B2,B3]=U2A(U);
%Create integer points
[Psi0,X1,X2]=cascadeskeleton(A);
%Cascade c times
[Psi0,X1,X2]=cascPhi(Psi0,X1,X2,A,c);
%Create the 3 wavelets
[Psi1,X1,X2]=cascPsi(Psi0,X1,X2,B1);
[Psi2,X1,X2]=cascPsi(Psi0,X1,X2,B2);
[Psi3,X1,X2]=cascPsi(Psi0,X1,X2,B3);

Z=X1+1i*X2;

[x,~]=size(X1);
t1=(x-1)/(M-1)+1 ;%the index corresponding to 1
t2=2*(t1-1)+1;%the index corresponding to 2
%X1(t1,t1);

%% Start with Psi0

X=X1(t1,:);
Phi=Psi0(t1,:);

Name=strcat('F_psi0_1_x2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_2');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


X=X2(:,t1).';
Phi=Psi0(:,t1).';

Name=strcat('F_psi0_x1_1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_1');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end

%%
%Now for Psi1

X=X1(t1,:);
Phi=Psi1(t1,:);

Name=strcat('F_psi1_1_x2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_2');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


X=X2(:,t1).';
Phi=Psi1(:,t1).';

Name=strcat('F_psi1_x1_1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_1');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end

%%
%Now for Psi1 at t=2

X=X1(t2,:);
Phi=Psi1(t2,:);

Name=strcat('F_psi1_2_x2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_2');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


X=X2(:,t2).';
Phi=Psi1(:,t2).';

Name=strcat('F_psi1_x1_2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_1');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end




%%
%Now for Psi2

X=X1(t1,:);
Phi=Psi2(t1,:);

Name=strcat('F_psi2_1_x2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_2');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


X=X2(:,t1).';
Phi=Psi2(:,t1).';

Name=strcat('F_psi2_x1_1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_1');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end

%%
%Now for Psi3

X=X1(t1,:);
Phi=Psi3(t1,:);

Name=strcat('F_psi3_1_x2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_2');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


X=X2(:,t1).';
Phi=Psi3(:,t1).';

Name=strcat('F_psi3_x1_1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
plot(X,real(Phi),'b-');
if opt(2)==1
    hold on
    plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
    le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
    set(le,'fontsize',12,'location','best');
end
axis square tight; set(gca,'box','on');
xl=xlabel('x_1');  yl=ylabel(''); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end



































% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Rpsi0_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,real(Psi0),real(Psi0));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Ipsi0_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,imag(Psi0),imag(Psi0));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_psi1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,real(Psi1),imag(Psi1));
% %h=PhasePlot(Z,Psi1,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Rpsi1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,real(Psi1),real(Psi1));
% %h=PhasePlot(Z,Psi1,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Ipsi1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,imag(Psi1),imag(Psi1));
% %h=PhasePlot(Z,Psi1,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_psi2_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,real(Psi2),imag(Psi2));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Rpsi2_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,real(Psi2),real(Psi2));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Ipsi2_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,imag(Psi2),imag(Psi2));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_psi3_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,real(Psi3),imag(Psi3));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Rpsi3_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,real(Psi3),real(Psi3));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% %Create plots of scaling function and wavelet
% Name=strcat('F_Ipsi3_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %I guess we don't do phase plots then wtf
% h=surf(X1,X2,imag(Psi3),imag(Psi3));
% %h=PhasePlot(Z,Psi0,col);
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');  yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end


% 
% 
% Name=strcat('F_psi1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=PhasePlot(Z,Psi1,col);
% view(-45,45)
% %view(0,90)
% 
% 
% % if opt(2)==1
% %     hold on
% %     plot(X,imag(Phi),'c-',X,abs(Phi),'k-');
% %     le=legend('Real(\phi)', 'Imag(\phi)','Abs(\phi)');
% %     set(le,'fontsize',12,'location','best');
% % end
% axis square tight on; set(gca,'box','off');
% xl=xlabel('x_1');
% yl=ylabel('x_2'); 
% set([xl,yl],'fontsize',12);
% set(findall(gca,'type','line'),'linewidth',1);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end






















% 
% Name=strcat('F_psi_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% plot(X,real(Psi),'b-');
% if opt(2)==1
%     hold on
%     plot(X,imag(Psi),'c-',X,abs(Psi),'k-');
%     le=legend('Real(\psi)', 'Imag(\psi)','Abs(\psi)');
%     set(le,'fontsize',12,'location','best');
% end
% axis square tight; set(gca,'box','on');
% xl=xlabel('');
% yl=ylabel(''); 
% set([xl,yl],'fontsize',12);
% set(findall(gca,'type','line'),'linewidth',1);
% %Print locally
% print('-dpng', Name);
% %Print to TeX folder
% if opt(1)==1
%     print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end
% 
% 
% 
% 
% 
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


