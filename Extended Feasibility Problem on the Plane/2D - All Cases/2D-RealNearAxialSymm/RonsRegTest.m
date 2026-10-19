function [Out,reg]=RonsRegTest(U,D,tol)


%Test REGULARITY 

[A,~,~,~]=U2A(U);
%Further, need to take convolutions to find transfer operator
B = conv2(A,flipud(fliplr(A)));  
B = B/sum(sum(B));

%options 1 uses 2I, options 2 uses a different dilation matrix
options = 1;
%main runs Ron's regularity testing code
T=max(max(imag(B)));
if T>10^-8
    warning('Mask A_k not real')
end
eig = main(real(B),options);

reg=-log(abs(eig(1)))/log(4);
warning('on','all')
disp(' ')
if reg<D-tol
    warning(['Regularity low (Diff=',num2str(D-reg),')']) 
    Out=1;
else
    disp(['Regularity as expected (Diff=',num2str(D-reg),')']) 
    Out=0;
end

disp(' ')
