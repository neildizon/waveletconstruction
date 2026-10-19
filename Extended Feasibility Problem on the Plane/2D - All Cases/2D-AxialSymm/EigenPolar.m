close all
clear all
clc
M=6;
D=M/2-1;

tol=10^-6;
testtol=10^-6;
maxiter=3000000;


Ustart=projJ(projK(rand(4,4,M,M)+1i*rand(4,4,M,M)));
load AxialResults; Ustart = End_M6D2_Axial_2;
load AxialResults; Ustart = End_M6D1_Axial_1; D=1;
U=Ustart;

[A,B1,B2,B3]=U2A(U);
%Create integer points
[Psi0,X1,X2]=cascadeskeleton(A);
[Psi0,X1,X2]=cascPhi(Psi0,X1,X2,A,6);

VV=angle(Psi0);
RR=abs(Psi0);
%RGB=rescale(VV,0,1);
fig=figure;
surf(X1,X2,RR,VV,'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
title('\phi','fontsize',12);
colorbar


