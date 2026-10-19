clear
clc
close all
maxiter=50000;


for k=1:6
filename = strcat('Fig4',num2str(k));
load(filename)

U1(:,2,:)=U1(:,2,:)/U1(2,2,1);
[~,~,M]=size(U1);

nameM=strcat('PDR',num2str(M),'neil');
cascadeplots(U1,7,nameM,[0,1]);
Uplots(U1,100,nameM,0);
mychangeplot(Change1,nameM,maxiter);
end

