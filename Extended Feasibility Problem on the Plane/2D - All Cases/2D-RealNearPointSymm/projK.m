function Useq = projK(Useq)
[~,~,M,~]=size(Useq);
I=eye(4);
%J=I([2,1,4,3],:);
K=I([3,4,1,2],:);
for kk=1:M
    for jj=1:M/2
    Useq(:,:,kk,jj) = (Useq(:,:,kk,jj) + K*Useq(:,:,kk,jj+M/2))/2;
    Useq(:,:,kk,jj+M/2) = K*Useq(:,:,kk,jj);
    end
end
end