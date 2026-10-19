clear 
clc
format long
tic
close all




X=[-0.984080680822082   0.240664190569506   1.025996139358941  -0.240664190569516  -0.984080680822080  -1.000000000000000]; %perfect
X=[0.075070157121286   1.059093027310480  -1.120101396292245   0.425209707751813   0.972887595471089   1.000000000000000]; %1.121
X=[0.150391169090503   1.116629544065703  -1.240547493988664   0.970985587996835   0.571547049964669  -1.000000000000033];  %1.247

%Without the first derivative
X=[-0.755935430159835  -0.008430595657212   0.378178395771338  -0.728516455275570  -0.201923807181776   1.000000000000000]

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
%C=@(z) 1 + (abs(bigphi(X,-1)))^2;

H=@(z) B(z)./C(z);
%H=@(z) -0.545614591461245e-1.*z.^4 + 0.9036684005e-3.*z.^7 + 0.792694561956712e-2.*z.^6 -1.61231494977372*10^(-11).*z.^5 + 0.539519947370331.*z.^2 + 0.131943583454538.*z.^3 + 0.429561459276319.*z - 1.63557346838288*10^(-11) - 0.624087110031452e-1./z + 0.711456628544398e-2./z.^2;


%%

disp('Calculating FFT')

N=10000;               %sampling frequency
T = 1/N;                % Sampling period       
t = (0:T:1-1/N);        % Time vector
Y = H(exp(2*pi*1i*t));
h=fft(Y)/length(t);



sorted=[h(length(h)/2 + 1:end) h(1:length(h)/2)];
hnew=sorted((min(find(abs(sorted)>1e-10))): (max(find(abs(sorted)>1e-10))));



%trunc=max(max(find(abs( h(1:length(h)/2))>1e-12)), length(h)/2-min(find(abs(h(length(h)/2 + 1:end))>1e-12)));
%hnew=[h(length(h)-trunc:end) h(1:trunc)];


size(find(abs(h)>1e-3))
size(hnew)

%%
%disp('Computing the cascade skeleton')
[Phi,X0]=cascadeskeleton(hnew);
[Phi,X0]=cascPhi(Phi,X0,hnew,7);
 
%disp('Plotting results')
plot(X0-2,real(Phi),'b-');
hold on

       
x=X;
y=x(2);a=x(3);c=x(4);d=x(5);t=x(6);x=x(1);
ObjFuncVal = y^2 + 1/16 + (1/4)*x + (1/8)*a + (1/4)*x^2 + (1/4)*a*x + (1/16)*a^2

[Phi,X]=cascadeskeleton(hnew);
ssigma = abs(Phi(4)-Phi(6)) + abs(Phi(3)-Phi(7)) + abs(Phi(2)-Phi(8)) + abs(Phi(1)-Phi(9)) + abs(Phi(10))

toc