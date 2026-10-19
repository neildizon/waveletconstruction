clear 
clc
format long;close all
X=[-0.625000001907116  -0.624999998092884  -0.000000003151766  -0.500000000010035   0.499999999989965   1.250000000000000]; %fval 0
%X=[-0.385971837097599   0.798606715813131  -0.209706891147386   0.670581815573345  -0.268902433458136  -1.236736395095559].'; %fval 0.7236
%X=[-0.078589740605998   1.123051284980618  -0.626213975808564   0.331624630116747   0.765569772423726   1.463795453112320].'  %fval 0.9180

phi(1) = smallphi(X,1);
phi(2) = smallphi(X,2);
phi(3) = smallphi(X,3);
phi(4) = smallphi(X,4);
psi(1) = smallpsi(X,1);
psi(2) = smallpsi(X,2);
psi(3) = smallpsi(X,3);
psi(4) = smallpsi(X,4);
P=@(z) bigphi(X,z.^2).*bigphistar(X,z.^2) + bigpsi(X,z.^2).*bigpsistar(X,z.^2) - bigphi(X,z).*bigphistar(X,z) - bigphi(X,-z).*bigphistar(X,-z);
B=@(z) bigphi(X,z.^2).*bigphistar(X,z) + (z.^5).*bigphi(X,-z).*bigpsistar(X,z.^2);
C=@(z) bigphi(X,z).*bigphistar(X,z) + bigphi(X,-z).*bigphistar(X,-z);
H=@(z) B(z)./C(z);

%FFT calculations
N=10000;                %sampling frequency
T = 1/N;                % Sampling period       
t = (0:T:1-1/N);        % Time vector
Y = H(exp(2*pi*1i*t));
h=fft(Y)/length(t);

sorted=fftshift(h);
hnew=sorted((min(find(abs(sorted)>1e-6))): (max(find(abs(sorted)>1e-6))));



%Plotting results
[Phi,X0]=cascadeskeleton(hnew);
center=symmcenter(hnew);
P = X0(center)+0.5;
[Phi,X0]=cascPhi(Phi,X0,hnew,7);
%plot(X0,real(Phi),'k-');
plot(X0-(P-2.5),real(Phi),'k-');        %Note that 2.5 here is the center of cardinality
hold on
grid on 

x=X;
y=x(2);a=x(3);c=x(4);d=x(5);t=x(6);x=x(1);
ObjFuncVal = 1/2*y^2 - y*x + 1/2*a^2 + 1/2*x^2
SIGMA(hnew)
%toc;