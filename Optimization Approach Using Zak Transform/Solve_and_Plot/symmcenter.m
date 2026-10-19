function center = symmcenter(hnew)

[Phi,X]=cascadeskeleton(hnew);
[Phi,X]=cascPhi(Phi,X,hnew,1);

[~,P] = max(abs(Phi));
center = P/2;