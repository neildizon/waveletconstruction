clear
clc
close all

tol=10^-6; %for stopping criteria
testtol=10^-6; %for all wavelet tests

%M=8; maxiter=300000;
M=6; maxiter=50000;
%M=6; maxiter=15000;
experiment=5;

sample=0;
Ustart=projJ(randn(2,2,M)+randn(2,2,M)*1i);
c=numel(Ustart);
D=M/2-1; %number of derivatives to check
Ustartsave=[];
Summary=[];

while sample < experiment
sample=sample+1;
disp(['Sample ',num2str(sample)]);
[~,Change1,run1,time1,rem1]=algPDR(Ustart,D,maxiter,tol);
%[~,Change2,run2,time2,rem2]=algPDRCombined(Ustart,D,maxiter,tol);

Ustartvector = reshape(Ustart,[1 c]);
Vector=[sample,run1,time1,rem1];
%Vector=[sample,run1,time1,rem1,run2,time2,rem2];

Ustartsave = [Ustartsave; Ustartvector];
Summary = [Summary; Vector];
Ustart=projJ(rand(2,2,M)+rand(2,2,M)*1i);
end

xlswrite('NewTrialM6_RealM6D2_6',Summary);
save('NewTrialM6_RealM6D2_6','Ustartsave');

