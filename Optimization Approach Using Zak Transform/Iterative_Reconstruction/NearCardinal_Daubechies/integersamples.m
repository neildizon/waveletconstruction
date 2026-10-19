function S = integersamples(C,M)
n=length(C);
S=zeros(n-1+M+1,1);         %because n-1 = N
L=[1:1:n+M].';

for k=1:n
    S=S+C(k)*phivec((L-1)-(k-1));
end
