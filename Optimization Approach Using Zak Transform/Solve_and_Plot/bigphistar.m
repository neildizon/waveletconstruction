function y = bigphistar(X,z)
y=zeros(size(z));
for k=1:4
    y=y+(conj(smallphi(X,k))*z.^-k);
end
