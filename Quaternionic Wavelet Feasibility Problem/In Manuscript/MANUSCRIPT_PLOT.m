function MANUSCRIPT_PLOT(filename)
angleview = [-45 45];
angleview = [135 45];
cascadelevel = 5;
warning('off');

load(filename);
if exist('PDR')
    U=PDR;
else
    error('PDR file not found.')
end

[a,B1,B2,B3]=U2A(U);
[~,M]=size(a);

B=zerosq(M^2,M^2);
for x1=1:M
for x2=1:M
for k1=1:M
for k2=1:M
    X1=2*x1-k1;
    X2=2*x2-k2;
    if X1>0 && X1<M+1 && X2>0 && X2<M+1
        B(nu(x1,x2,M),nu(X1,X2,M))=a(k1,k2);
    end
end
end
end
end

BB=conj(B);
BBB=BB';
BB=complexadjoint(BB);
[V,D]=eig(BB);
%Select the eigenvalue 1/4
[~,yy]=find(real(D)>.249,1, 'last');
x0 = V(:,yy);

x1 = x0(1:M^2);
x2 = -conj(x0(M^2+1:end));
%Phi = conj(quaternion(real(x1),real(x2),imag(x2),imag(x1)));
Phi = reshape(conj(quaternion(real(x1),real(x2),imag(x2),imag(x1))),[M M]);
[X1,X2]=meshgrid(0:M-1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Psi0,X1,X2]=cascPhi(Phi,X1,X2,a,cascadelevel);
VW=angle(Psi0).*axis(Psi0);
RR=abs(Psi0);
XXX=(x(VW));
YYY=(y(VW));
ZZZ=(z(VW));
RGB=cat(3,XXX,YYY,ZZZ);
RGB=rescale(RGB,0,1);
fig=figure;
surf(X1,X2,RR,RGB,'FaceColor','interp','EdgeColor','interp');
view(angleview)
axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
%title('\phi','fontsize',12);

name = strcat('pics_wavelet_ensemble/',filename,'_Phi');
savefig(fig,name)


%%%%%%%%%%%%%%%%%%%%%%%%%% First Wavelet %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Psi1,X1,X2]=cascPsi(Psi0,X1,X2,B1);
VW=angle(Psi1).*axis(Psi1);
RR=abs(Psi1);
XXX=(x(VW));
YYY=(y(VW));
ZZZ=(z(VW));
RGB=cat(3,XXX,YYY,ZZZ);
RGB=rescale(RGB,0,1);
fig=figure;
surf(X1,X2,RR,RGB,'FaceColor','interp','EdgeColor','interp');
view(angleview)
axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
%title('\psi_1','fontsize',12);

name = strcat('pics_wavelet_ensemble/',filename,'_Psi1');
savefig(fig,name)

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Second Wavelet%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Psi1,X1,X2]=cascPsi(Psi0,X1,X2,B2);
VW=angle(Psi1).*axis(Psi1);
RR=abs(Psi1);
XXX=(x(VW));
YYY=(y(VW));
ZZZ=(z(VW));
RGB=cat(3,XXX,YYY,ZZZ);
RGB=rescale(RGB,0,1);
fig=figure;
surf(X1,X2,RR,RGB,'FaceColor','interp','EdgeColor','interp');
view(angleview)
axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
%title('\psi_2','fontsize',12);

name = strcat('pics_wavelet_ensemble/',filename,'_Psi2');
savefig(fig,name)


%%%%%%%%%%%%%%%%%%%%%%%%%% THIRD WAVELET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Psi1,X1,X2]=cascPsi(Psi0,X1,X2,B3);
VW=angle(Psi1).*axis(Psi1);
RR=abs(Psi1);
XXX=(x(VW));
YYY=(y(VW));
ZZZ=(z(VW));
RGB=cat(3,XXX,YYY,ZZZ);
RGB=rescale(RGB,0,1);
fig=figure;
surf(X1,X2,RR,RGB,'FaceColor','interp','EdgeColor','interp');
view(angleview)
axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
%title('\psi_3','fontsize',12);

name = strcat('pics_wavelet_ensemble/',filename,'_Psi3');
savefig(fig,name)

mychangeplot(Uchange,filename,length(Uchange));
Quat_separability_test(filename);
Quat_orthonormality_check(filename);
end



