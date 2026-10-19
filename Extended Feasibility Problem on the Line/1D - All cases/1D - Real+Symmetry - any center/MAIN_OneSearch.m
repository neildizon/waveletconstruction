clear
clc
close all

tol=10^-9; %for stopping criteria
testtol=10^-6; %for all wavelet tests

M=8;
D=M/2-2; %number of derivatives to check
maxiter=500000;
Ustart=projJ(randn(2,2,M)+randn(2,2,M)*1i);

disp(['Product DR running']);
[U1,Change1,run1,time1,rem1]=algPDR_plot(Ustart,D,maxiter,tol);
WaveletTests(U1,D,testtol);
U1(:,2,:)=U1(:,2,:)/U1(2,2,1);

%PLOTS
nameM=strcat('PDR',num2str(M),'neil');
cascadeplots(U1,7,nameM,[0,1]);
Uplots(U1,100,nameM,0);
mychangeplot(Change1,nameM,maxiter);

