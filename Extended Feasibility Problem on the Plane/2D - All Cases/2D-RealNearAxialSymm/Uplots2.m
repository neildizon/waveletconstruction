function Out=Uplots2(U,c,name,opt)
%Creates Matrix function U(xi) by reverse Fourier and plots
%the scaling function and wavelet against xi
[dim,~,M,~]=size(U);

    %Create Fourier Coefficients A_k
    A=zeros(dim,dim,M,M);
        for kk=1:M
        for jj=1:M
        for ll=1:M
        for nn=1:M
            A(:,:,jj,kk)=A(:,:,jj,kk)+U(:,:,ll,nn)*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
        end
        end
        end
        end
    A=A/M^2;
%What is the bottom row of A? It gets ignored through the rest of the
%calculation, which is good because I don't think they mean anything.

%Create symbolic function using above coefficients
Mx=c*M;
M0=zeros(Mx+1,Mx+1);
M1=zeros(Mx+1,Mx+1);
M2=zeros(Mx+1,Mx+1);
M3=zeros(Mx+1,Mx+1);
for xx=1:Mx+1
for yy=1:Mx+1
for jj=1:M
for kk=1:M
    M0(xx,yy)=M0(xx,yy)+A(1,1,jj,kk)*exp(2i*pi*((xx-1)*(jj-1)+(yy-1)*(kk-1))/(Mx));
    M1(xx,yy)=M1(xx,yy)+A(1,2,jj,kk)*exp(2i*pi*((xx-1)*(jj-1)+(yy-1)*(kk-1))/(Mx));
    M2(xx,yy)=M2(xx,yy)+A(1,3,jj,kk)*exp(2i*pi*((xx-1)*(jj-1)+(yy-1)*(kk-1))/(Mx));
    M3(xx,yy)=M3(xx,yy)+A(1,4,jj,kk)*exp(2i*pi*((xx-1)*(jj-1)+(yy-1)*(kk-1))/(Mx));
end
end
end
end

%Create plots for M0, M1
Out=cat(3,M0,M1,M2,M3);

xi=0:1/Mx:1;
[X,Y]=meshgrid(xi);


% Name=strcat('F_M0_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=surf(X,Y,real(M0),imag(M0));
% %View Angle
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end


Name=strcat('F_RM0_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,real(M0),real(M0));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


Name=strcat('F_IM0_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,imag(M0),imag(M0));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


% Name=strcat('F_M1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %
% h=surf(X,Y,real(M1),imag(M1));
% %h=PhasePlot(Z,M1,col);
% %View Angle
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end


Name=strcat('F_RM1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,real(M1),real(M1));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


Name=strcat('F_IM1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,imag(M1),imag(M1));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


% Name=strcat('F_M2_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% %Plot
% h=surf(X,Y,real(M2),imag(M2));
% %h=PhasePlot(Z,M2,col);
% %View Angle
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end


Name=strcat('F_RM2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,real(M2),real(M2));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


Name=strcat('F_IM2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,imag(M2),imag(M2));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


% Name=strcat('F_M3_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=surf(X,Y,real(M3),imag(M3));
% %View Angle
% view(-45,45)
% %view(0,90)
% 
% axis square tight on; set(gca,'box','off');
% xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
% set([xl,yl],'fontsize',12);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end


Name=strcat('F_RM3_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,real(M3),real(M3));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1');  yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end


Name=strcat('F_IM3_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=surf(X,Y,imag(M3),imag(M3));
%View Angle
view(-45,45)
%view(0,90)

axis square tight on; set(gca,'box','off');
xl=xlabel('\xi_1');  yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end



    
    