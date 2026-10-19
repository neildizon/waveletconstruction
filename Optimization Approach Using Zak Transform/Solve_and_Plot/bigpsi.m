function y = bigpsi(X,z)
y=zeros(size(z));
for k=1:4
    y=y+(smallpsi(X,k)*z.^k);
end
