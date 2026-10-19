function g = GAMMA(hnew);
%MEASURE OF CARDINALITY
[Phi,~]=cascadeskeleton(hnew);
[~,P]=max(abs(Phi));
g=0;
X=zeros(size(Phi));
X(P)=1;
for k=1:length(Phi)
    g = g + abs(Phi(k)-X(k));
end
end