function cascadeplots2(U,c,name,opt)

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


%% Start with Psi0

% %Create plots of scaling function and wavelet
% Name=strcat('F_psi0_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=surf(X1,X2,real(Psi0),imag(Psi0));
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


%Create plots of scaling function and wavelet
Name=strcat('F_Rpsi0_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,real(Psi0),real(Psi0),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


%Create plots of scaling function and wavelet
Name=strcat('F_Ipsi0_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,imag(Psi0),imag(Psi0),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end

%% Now Psi1


% %Create plots of scaling function and wavelet
% Name=strcat('F_psi1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=surf(X1,X2,real(Psi1),imag(Psi1));
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


%Create plots of scaling function and wavelet
Name=strcat('F_Rpsi1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,real(Psi1),real(Psi1),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


%Create plots of scaling function and wavelet
Name=strcat('F_Ipsi1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,imag(Psi1),imag(Psi1),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end

%% Now Psi2

% %Create plots of scaling function and wavelet
% Name=strcat('F_psi2_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=surf(X1,X2,real(Psi2),imag(Psi2));
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



%Create plots of scaling function and wavelet
Name=strcat('F_Rpsi2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,real(Psi2),real(Psi2),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


%Create plots of scaling function and wavelet
Name=strcat('F_Ipsi2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,imag(Psi2),imag(Psi2),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end

%% Now Psi3

% %Create plots of scaling function and wavelet
% Name=strcat('F_psi3_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=surf(X1,X2,real(Psi3),imag(Psi3));
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


%Create plots of scaling function and wavelet
Name=strcat('F_Rpsi3_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,real(Psi3),real(Psi3),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


%Create plots of scaling function and wavelet
Name=strcat('F_Ipsi3_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X1,X2,imag(Psi3),imag(Psi3),'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end




















