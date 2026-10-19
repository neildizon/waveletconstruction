function SS = dynamicintegersamples(C,M)
ind = C(:,1);
[n,~]=size(C);
S=zeros(n-1+M+1,1);         %because n-1 = N
L=[ind(1):1:M+ind(end)].';

for k=ind(1):ind(end)
    S=S+CC(C,k)*phivec(L-k);
end
SS=[L,S];
