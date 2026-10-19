close all
clear all
clc

X1=[-0.625000001907116  -0.624999998092884  -0.000000003151766  -0.500000000010035   0.499999999989965   1.250000000000000]; %fval 0
X2=[-0.385971837097599   0.798606715813131  -0.209706891147386   0.670581815573345  -0.268902433458136  -1.236736395095559]; %fval 0.7236
%X3=[-0.078589740605998   1.123051284980618  -0.626213975808564   0.331624630116747   0.765569772423726   1.463795453112320];  %fval 0.9180

x1 = PlotMyResultSC_NC(X1,'k-',0.75);
x2 = PlotMyResultSC_NC(X2,'k:',0.75);
%x3 = PlotMyResultSC_NC(X3,'k:',0.25);

name1=strcat('\sigma \approx ',num2str(x1)) %name1=strcat('\gamma =',num2str(x1));
name2=strcat('\sigma \approx ',num2str(x2));
%name3=strcat('\sigma = ','1.31000');

xlim([-2,7]);
legend(name1,name2,'FontSize',12)
hold off

