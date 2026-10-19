function y = bigphi(X,z)
y=zeros(size(z));

for k=1:4
    y=y+(smallphi(X,k)*z.^k);
end
