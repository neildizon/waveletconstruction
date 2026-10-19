function myplot(CC,M,level,style,width,adjust)
    %M length of support of phi
    %level of cascade
    %C should contain index in first column and coeff at index in second col
ind = CC(:,1);
C = CC(:,2); 

%LOAD THE SCALING FILTERS AND PERFORM CASCADE ALGORITHM
load('mycardinal');
A=2*hnew;
[Phi,X]=cascadeskeleton(A);
[Phi,X]=cascPhi(Phi,X,A,level);
Phi=real(Phi);

%COMPUTES THE NUMBER OF POINTS IN THE CASCADE LEVEL FROM 1(inc) to 2(exc)
%THIS GIVES THE NUMBER OF POINTS TO SKIP IN A ONE INTEGER SHIFT
shift = length([1:1/(2^level):2-(1/(2^level))]);

%PLACES PHI IN THE POSITION OF THE FIRST INDEX
F = [Phi,zeros(size(1/(2^level):1/(2^level):length(C)-1))];

%INITIAL VALUE OF THE LINEAR COMBINATION
S = zeros(size(F));

%ALL X VALUES OF THE PLOT OVER THE WHOLE SUPPORT OF S
X = [ind(1):1/(2^level):M+ind(end)];

%COMPUTES THE LINEAR COMBINATION
for k=1:length(C)
    S = S + C(k)*circshift(F,(k-1)*shift);
end

plot(X-adjust,S,style,'LineWidth',width);








