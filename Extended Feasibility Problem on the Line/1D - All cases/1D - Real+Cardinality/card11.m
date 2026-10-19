function Ucard=card11(z,M,EPS,J)

A=zeros(M/2,M);
b=zeros(M/2,1);
for k=1:M/2
    A(k,k)=1;
    A(k,M/2 + k)=(-1)^J;
    b(k,1)=-exp(2*pi*1i*J*(k-1)/M);
end

for j=1:M/2
z=projcirclecard(A(j,:),b(j),z,EPS);
Ucard=z;
end


