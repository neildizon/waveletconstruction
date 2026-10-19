function ssigma = PlotMyResultSC_NC(X,mycolor,width)

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

%FFT
N=10000;               %sampling frequency
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
plot(X0-(P-2.5),real(Phi),mycolor,'LineWidth',width);        %Note that 2.5 here is the center of cardinality
hold on
grid on 

ssigma = SIGMA(hnew)
end
