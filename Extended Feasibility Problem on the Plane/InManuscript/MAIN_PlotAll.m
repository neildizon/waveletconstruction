clear
clc
close all
maxiter=8000000;


for k=7:14
filename = strcat('Fig4',num2str(k));
load(filename)
[~,~,~,M]=size(PDR);

%Plotting begins
name=filename;
col='dn';
nameM=strcat(name,num2str(M));
nameMC=strcat(nameM,'_',col);

if k==8 || k==9
cascadeplots(PDR,5,nameMC,col,0);
else
cascadeplots2(PDR,5,nameM,0)
end    
%Uplots(PDR,50,nameMC,col,0);
end

