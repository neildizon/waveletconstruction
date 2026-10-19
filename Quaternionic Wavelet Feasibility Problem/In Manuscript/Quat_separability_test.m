function y = Quat_separability_test(filename) 
clc
load(filename);
if exist('PDR')
    U=PDR;
else
    U=sum(U,5)/size(U,5);
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

[Psi0,X1,X2]=cascPhi(Phi,X1,X2,a,5);
[mm,~]=size(Psi0);
delta=X1(1,2)-X1(1,1);
delta2=delta*delta;

%make sure that the norm is one
absPsi02 = (abs(Psi0)).^2;
firstintegral=0;
for kk=1:mm
for jj=1:mm
    firstintegral = firstintegral + absPsi02(jj,kk)*delta2;
end
end
Psi0 = Psi0/sqrt(firstintegral);


separability=0;
BXY=Psi0;
BX=sum(Psi0,1)*delta;
BY=sum(Psi0,2)*delta;

for kk=1:mm
for jj=1:mm
    separability = separability + ((abs(BXY(jj,kk)-BY(jj)*BX(kk)))^2)*delta2;
end
end

if abs(separability)<10e-2
    fprintf('\nThe scaling function is close to separable with measure S = %0.6f.\n',separability);
else
    fprintf('\nThe scaling function is nonseparable with measure S = %0.6f.\n',separability);
end
end


    
