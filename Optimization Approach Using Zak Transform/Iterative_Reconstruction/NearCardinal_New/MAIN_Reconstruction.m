clear all
clc
close all

%SINCE THE ORIGINAL CODE ASSUMES THAT THE SCALING FUNCTION IS SUPPORTED
%FROM [0,M], WE HAVE TO MAKE AN ADJUSTMENT AS ITS SUPPORT DOES NOT START FROM
%ZERO. WE DO THIS BY INTRODUCING A TRANSLATOR ''adjust''.
adjust = 2; % We use '2' because the support starts at -2.

%INITIALIZATIONS
iteration = 5;                            % number of iterations in computing the inverse
P=3; M=9;                                  % Scaling function is card at P-adjust, supported on [0-adjust,M-adjust]
%ind = [-2 -1 0 1 2 3 4 5 6].';            % the k in C_k  
Cind= [1,-2,3,-4,3,-2,1,-12,10].';         % the value of C_k in the linear combination 
stop = length(Cind);
ind = [-4:1:stop-4-1].';
C = [ind,Cind];  
myplot(C,M,7,'k-',0.75,adjust)                             % Plots the given function based on C_k and the scaling function

hold on
S = dynamicintegersamples(C,M);           % Computes the function values at all integers in the rightful support of f
                   

                 
%Coefficients for f_0
lastindex = S(end,1)-P;                   % Takes note of the last index of f_0 w/c is the right endpoint of its support
index0 = [S(1,1)-P:1:lastindex].';        % index of the coefficients for f_0
c0k = S(:,2);                             % value at index of the coefficients for f_0
C0=[index0,c0k];
%CC(C0,100);                              % Access value of C0 at an  'righful' index

Cprev=C0;                                 % Initialize Cprev

%COMPUTES THE COEFFICIENTS OF f_J
for J=1:iteration
    CJ = NextCoeff(Cprev,C0,P,J,lastindex,S); 
    Cprev = CJ;
    if J==1
        myplot(CJ,M,7,'k:',0.75,adjust)
    elseif J==3
        myplot(CJ,M,7,'k-.',0.75,adjust)
    end
end

C.'
CJ
myplot(CJ,M,7,'k--',0.75,adjust)
xlim([-7 12])
legend({'$f(x)$','$f_1(x)$','$f_3(x)$','$f_{5}(x)$'},'Interpreter','latex','FontSize',12);
grid on


