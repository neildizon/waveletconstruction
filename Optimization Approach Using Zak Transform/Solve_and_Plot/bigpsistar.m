function y = bigpsistar(X,z)
y=zeros(size(z));
for k=1:4
    y=y+(conj(smallpsi(X,k))*z.^-k);
end
