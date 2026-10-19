clear 
clc
format long; close all

X=[0.075070157121274   1.059093027310479  -1.120101396292219   0.425209707751813   0.972887595471084   1.000000000000000]; %fval 1.1114 ConstantC
X=[0.150391169090771   1.116629544065960  -1.240547493989205   0.970985587997049   0.571547049965041  -1.000000000000000]; %fval 1.2362 ConstantC

%Without the second derivative
%X=[ -0.573582487800727  -0.446355239804515  -0.237612585578166  -0.065348793948443   0.723850402736673   1.000000000000000]
%X=[0.217823105232980  -0.674269110842106   0.064586980253632   0.177828292388910   0.685902935870073   1.000000000000000]
%X=[  -0.446355220599947  -0.573582501334374   0.237612619664051  -0.723850411027290   0.065348789693710   1.000000003664814]

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
[Phi,X0]=cascPhi(Phi,X0,hnew,7);
plot(X0-2,real(Phi),'k-');        %Note that 2.5 here is the center of cardinality
hold on
grid on 

x=X;
y=x(2);a=x(3);c=x(4);d=x(5);t=x(6);x=x(1);
ObjFuncVal = 1/2*y^2 - y*x + 1/2*a^2 + 1/2*x^2
[Phi,X0]=cascadeskeleton(hnew);
abs(Phi(4)-Phi(6)).^2 + abs(Phi(7))^2
%toc;