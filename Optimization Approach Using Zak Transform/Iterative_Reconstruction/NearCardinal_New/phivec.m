function phiA = phivec(A)
[m,n] = size(A);
phiA = zeros(size(A));
for j=1:m
    for k=1:n
        phiA(j,k)=phi(A(j,k));
    end
end
end
   
    