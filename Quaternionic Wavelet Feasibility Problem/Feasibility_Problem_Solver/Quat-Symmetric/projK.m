function Useq = projK(U)
I=eye(8,8);
K=I([5 6 7 8 1 2 3 4],:);
[~,~,~,M]=size(U);
Useq=U;
for kk=1:M
    for jj=1:M/2
    Useq(:,:,kk,jj) = (Useq(:,:,kk,jj) + K*Useq(:,:,kk,jj+M/2))/2;
    Useq(:,:,kk,jj+M/2) = K*Useq(:,:,kk,jj);
    end
end
end