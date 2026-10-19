clear all
close all
clc
load('CardinalCollection.mat','Card1_M6_D2_Eps03');
PA=Card1_M6_D2_Eps03;
PA(:,2,:)=PA(:,2,:)/PA(2,2,1);
[A,B]=U2A(PA);
[Phi,X]=cascadeskeleton(A);
Phi=real(Phi);


