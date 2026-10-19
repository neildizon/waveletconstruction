function gamma = PlotMyResult(X,mycolor,width)
%GOING TO DAUBECHIES
% X=[0.026242049008455   1.060897357406540  -0.988230490966730   0.388503963376064   0.915076183756993   1.129506172139109]; %-0.75+0.0 red
% X=[0.175029894095232   1.080712648612661  -1.354541970793252   0.507692875209387   1.076865785407754   0.749911084566894]; %-0.75+0.05 yellow
% X=[0.247152373410221   1.110023519057485  -1.503608041182707   0.571293041941568   1.141946947534691   0.570645139799543]; %-0.75+0.10 magenta
% X=[0.304479862833055   1.139195881108932  -1.613052232377490   0.624451204073621   1.187867604541856   0.423099256008302]; %-0.75+0.15 cyan
% X=[0.354073121489654   1.168050133024740  -1.701984867969359   0.673201344333540   1.222773975592322   0.287515715125984]; %-0.75+0.20 blue
% X=[0.390071306404604   1.191067523250536  -1.763205230431384   0.711207047732629   1.244439985521894   0.180837643824878]; %closest solution black
% X=[0.3900713005 1.191067520 -1.763205219 0.7112070460 1.244439965 0.1808376275]; %real solution
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


[Phi,X0]=cascadeskeleton(hnew);
[~,center]=find(real(Phi)==max(real(Phi)));
PP = X0(center);
[Phi,X0]=cascPhi(Phi,X0,hnew,7);
plot(X0-(PP-1),real(Phi),mycolor,'LineWidth',width);  %Note that 1 here is the center of cardinality

hold on
grid on 
gamma = GAMMA(hnew)
end
