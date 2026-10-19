function Out=Uplots(U,c,name,col,opt)
%Creates symbolic Matrix function U(xi) by reverse Fourier and plots
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

%Output matrices of values of M0...M3 for other functions
Out=cat(3,M0,M1,M2,M3);

xi=0:1/Mx:1;
[X,Y]=meshgrid(xi);
Z=X+1i*Y;


Name=strcat('F_M0_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=PhasePlot(Z,M0,col);
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



Name=strcat('F_M1_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=PhasePlot(Z,M1,col);
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




Name=strcat('F_M2_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=PhasePlot(Z,M2,col);
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



Name=strcat('F_M3_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=PhasePlot(Z,M3,col);
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


%Now we'll make 
N=c*M;

%Create the X,Y points of the once contracted unit square centered at the
%origin
[X,Y]=meshgrid(-1/4:1/(2*N):1/4);

%Find the value of m0 at these new grid points.
m0=zeros(N+1,N+1);
for jj=1:M
for kk=1:M
    m0=m0+A(1,1,jj,kk)*exp(2i*pi*((kk-1)*Y+(jj-1)*X));
end
end

Z=X+1i*Y;

Name=strcat('F_Cohen_',name);
figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
h=PhasePlot(Z,m0,col);
%View Angle
view(-45,5)
%view(0,90)

axis square tight on; set(gca,'box','off');
zlim([0 inf])
xl=xlabel('\xi_1'); yl=ylabel('\xi_2'); 
set([xl,yl],'fontsize',12);
%Print locally
print('-dpng', strcat('pics\',Name));
%Print to TeX folder
if opt(1)==1
	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
end








% 
% Name=strcat('F_M1_',name);
% figure('Name',Name,'paperposition', [.25,.25,20,20],'paperunits','centimeters'); 
% h=PhasePlot(Z,M1,col);
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
% xl=xlabel('\xi_1');
% yl=ylabel('\xi_2'); 
% set([xl,yl],'fontsize',12);
% set(findall(gca,'type','line'),'linewidth',1);
% %Print locally
% print('-dpng', strcat('pics\',Name));
% %Print to TeX folder
% if opt(1)==1
% 	print( '-dpng', strcat('H:\University Data\00_PhD Project\Quaternion PhD\Thesis\pics\2D\',Name)); 
% end

    
    