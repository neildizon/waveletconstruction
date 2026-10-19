function [U,S,V]=svSVD(Aquat)
% Computes the singular value decomposition for a block matrix Aquat of SV matrices
% Note that Aquat = U*S*V'
[n,~]=size(Aquat);
m=2*n;
Vbar=zeros(m,n);
Ubar=zeros(m,n);
if isSVblock(Aquat)==1,
    A=complexadjoint(Aquat);
    A=A([[1:2:n] [n+2:2:m]],[[1:2:n] [n+2:2:m]]);
    [Ubar([[1:2:n] [n+2:2:m]],:),Sbar,Vbar([[1:2:n] [n+2:2:m]],:)]=svd(A);
    
    Ubar(:,2:2:end)=[-conj(Ubar(n+1:end,2:2:end)); conj(Ubar(1:n,2:2:end))];
    Vbar(:,2:2:end)=[-conj(Vbar(n+1:end,2:2:end)); conj(Vbar(1:n,2:2:end))];
    
    U = quaternion(real(Ubar(1:n,1:n)),real(-conj(Ubar(n+1:end,1:n))),imag(-conj(Ubar(n+1:end,1:n))),imag(Ubar(1:n,1:n)));
    V = quaternion(real(Vbar(1:n,1:n)),real(-conj(Vbar(n+1:end,1:n))),imag(-conj(Vbar(n+1:end,1:n))),imag(Vbar(1:n,1:n)));
    S=Sbar;
    %S=quaternion(S,zeros(size(S)),zeros(size(S)),zeros(size(S)));
else
    error('Warning! The given matrix is not composed of SV blocks.')
end