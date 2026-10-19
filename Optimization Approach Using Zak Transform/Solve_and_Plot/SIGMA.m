function s = SIGMA(hnew);
%MEASURE OF SYMMETRY
[Phi,~]=cascadeskeleton(hnew);
P=symmcenter(hnew);
s=0;

for k=1:P
    s = s + abs(Phi(k)-Phi(2*P-k+1));
end
for k=(2*P+1):length(Phi)
    s = s + abs(Phi(k));
end