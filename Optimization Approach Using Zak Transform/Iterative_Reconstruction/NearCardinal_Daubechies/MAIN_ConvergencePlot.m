clear
clc
close all 
format long
NUMBEROFITERATIONS = 100;                            % number of iterations in computing the inverse
P=1; M=5;                                  % Scaling function is card at P, supported on [0,M]
Cind = [1,-2,3,-4,3,-2,1,-12,10].';         % the value of C_k in the linear combination 
stop = length(Cind);
ind = [-4:1:stop-4-1].';
C = [ind,Cind];  
S = dynamicintegersamples(C,M);           % Computes the function values at all integers in the rightful support of f


cc = zeros(size(S(:,2)));
cc(1+P:length(C(:,2))+1) = C(:,2);
Y=[];

for iteration = 0:NUMBEROFITERATIONS
ccj = jthcoefficient(S,P,M,iteration);
normccj = norm(cc-ccj);
Y=[Y, normccj];
end
X = [0:1:length(Y)-1];
semilogy(X,Y)

grid on

Xdaub = X;
Ydaub = Y;
save('NormDifferenceDaub','Ydaub');
save('NormDifferenceDaub','Xdaub','-append');

