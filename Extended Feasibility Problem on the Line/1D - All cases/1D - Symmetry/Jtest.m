function N=Jtest(U)
%Tests the J condition

[~,~,M]=size(U);

A=U-circshift(U,[1,0,M/2]);

N=0;
for tt=1:N
    N=max(N,norm(A(:,:,tt)));
end



