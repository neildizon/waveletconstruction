function Useq = projJ(U)
I=eye(8,8);
J=I([3 4 1 2 7 8 5 6],:);
[~,~,~,M]=size(U);
Useq=U;
for kk=1:M/2
    for jj=1:M
    Useq(:,:,kk,jj) = (Useq(:,:,kk,jj) + J*Useq(:,:,kk+M/2,jj))/2;
    Useq(:,:,kk+M/2,jj) = J*Useq(:,:,kk,jj);
    end
end
end