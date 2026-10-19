clear all; close all; clc
%ind = [-2 -1 0 1 2 3 4 5 6];
%Cind=[1,-2,3,-4,3,-2,1,-12,10]; 

M=7;
level = 7;
load('CardinalCollection.mat','Card1_M8_D2_Eps0051');
PA=Card1_M8_D2_Eps0051;
PA(:,2,:)=PA(:,2,:)/PA(2,2,1);
[A,B]=U2A(PA);
[Phi,X]=cascadeskeleton(A);
[Phi,X]=cascPhi(Phi,X,A,level);
Phi=real(Phi);
shift = size([1:1/(2^level):2-(1/(2^level))]);
C = [1,-2,3,-4,3,-2,1].'; 
F = [Phi,zeros(size(1/(2^level):1/(2^level):length(C)-1))];
S = zeros(size(F));
X = [0:1/(2^level):M+length(C)-1];
for k=1:length(C)
    S = S + C(k)*circshift(F,(k-1)*shift);
end


plot(X,S);








