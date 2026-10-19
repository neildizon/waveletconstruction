clear all
close all
clc

M=6;
D=M/2-2;

tol=10^-6;
testtol=10^-6;
maxiter=8000000;

Ustart=projJ(projK(rand(4,4,M,M)+1i*rand(4,4,M,M)));
%load Fig412; Ustart = PDR; %In Manuscript


[PDR,Uchange]=algPDR(Ustart,D,maxiter,tol);
disp(' ')
disp(' ')
disp(' ')

WaveletTests(PDR,D,testtol);
SepTest(PDR,testtol);

[A,~,~,~]=U2A(PDR);
%Checking if the normalization are ok!
B=sum(sum(A));
C=sum(sum(abs(A).^2));
%The test for separability
JeffsTest=nonseparability(A);
disp(['Filter nonseparability = ',num2str(JeffsTest)]);


%Plotting begins
name='Z';
col='dn';
nameM=strcat(name,num2str(M));
%changeplot(Uchange,nameM,0);
cascadeplots2(PDR,5,nameM,0)
%cascadeplots3(PDR,5,nameM,[0,1])
%nameMC=strcat(nameM,'_',col);
%cascadeplots(PDR,5,nameMC,col,0);
%Uplots(PDR,50,nameMC,col,0);


