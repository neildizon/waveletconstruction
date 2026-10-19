function Useq=projJ(Useq)
[~,~,M,~]=size(Useq);
I=eye(4);
J=I([2,1,4,3],:);
%K=I([3,4,1,2],:);

for kk=1:M/2
    for jj=1:M
    Useq(:,:,kk,jj) = (Useq(:,:,kk,jj) + J*Useq(:,:,kk+M/2,jj))/2;
    Useq(:,:,kk+M/2,jj) = J*Useq(:,:,kk,jj);
    end
end
end