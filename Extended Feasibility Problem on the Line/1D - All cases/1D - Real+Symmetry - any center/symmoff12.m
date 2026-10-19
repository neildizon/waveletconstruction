function Uoff=symmoff12(z,M,EPS,P)

A=zeros(M/2,M);
A(1,1) = 2;
for k=1:M/2-1;
    A(k+1,k+1)=1;
    A(k+1,M-k+1)=-(-1)^(2*P)*exp(-4*pi*i*(M-1-P)*k/M);
end
for j=1:M/2
z=projcircle(A(j,:),z,EPS);
Uoff=z;
end


