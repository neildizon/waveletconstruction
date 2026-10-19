clear all
close all
clc
load('CardinalCollection.mat','Card1_M8_D2_Eps0051');
PA=Card1_M8_D2_Eps0051;
PA(:,2,:)=PA(:,2,:)/PA(2,2,1);
[A,B]=U2A(PA);
[Phi,X]=cascadeskeleton(A);
Phi=real(Phi);

C=[1,-2,3,-4,3,-2,1,4,5,-2,-2].'; 
F = [Phi,zeros(1,6)];
S = zeros(size(F));
X = [0:1:length(F)-1];
for k=1:length(C)
    S = S + C(k)*circshift(F,k-1);
end


plot(X,S);



