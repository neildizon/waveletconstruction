function Udiag=symmdiag(z,M,EPS)

A=zeros(M/2,M);
for k=1:M/2 - 1;
    A(k+1,k+1)=1;
    A(k+1,M-k+1)=-exp(-2*pi*i*(M-1)*k/M);
end
A(M/2 + 1, M/2 + 1) = 2;
for j=2:M/2+1
z=projcircle(A(j,:),z,EPS);
Udiag=z;
end


