function S = checkintegersamples(C,M)
n=length(C);
S=zeros(n-1+M+1,1);         %because n-1 = N

for k=1:n
    for ll=1:length(S)
        S(ll)=S(ll)+C(k)*phi((ll-1)-(k-1));
    end
end
end
