function Udiag=symmdiag22(z,M,EPS,P)

A=zeros(M/2,M);
for k=1:M/2 - 1;
    A(k+1,k+1)=1;
    A(k+1,M-k+1)=-exp(-4*pi*i*(M-1-P)*k/M);
end
A(M/2 + 1, M/2 + 1) = 1 - (-1)^(2*(M-1-P));
for j=2:M/2+1
z=projcircle(A(j,:),z,EPS);
Udiag=z;
end


