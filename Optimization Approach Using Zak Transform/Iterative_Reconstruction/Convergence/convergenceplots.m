clear all
close all
clc
load('NormDifferenceMycardinal.mat');
load('NormDifferenceDaub.mat');

semilogy(Xdaub,Ydaub,'k--','LineWidth',0.75);
hold on
semilogy(Xdaub,Ymycardinal,'k-','LineWidth',0.75);
grid on
hold off
ylim([10e-15,100])
legend({'$_3\varphi$','$\varphi^{(1)}$'},'Interpreter','latex','FontSize',12);
xlabel({'number $n$ of iterations'},'Interpreter','latex','FontSize',14)
ylabel({'$\|c^{(n)}-c\|_2$'},'Interpreter','latex','FontSize',14)
