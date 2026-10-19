function Useq = projP(U)
I=eye(8,8);
P=I([2 1 4 3 6 5 8 7],:);
[~,~,~,M]=size(U);
Useq=U;
%First row
for kk=1:M/2+1
    Useq(:,:,1,kk) = (Useq(:,:,1,kk) + P*Useq(:,:,1,mod(M-(kk-1),M)+1)*P)/2;
    Useq(:,:,1,mod(M-(kk-1),M)+1) = P*Useq(:,:,1,kk)*P;
end

%First column
for jj=2:M/2+1
    Useq(:,:,jj,1) = (Useq(:,:,jj,1) + P*Useq(:,:,mod(M-(jj-1),M)+1,1)*P)/2;
    Useq(:,:,mod(M-(jj-1),M)+1,1) = P*Useq(:,:,jj,1)*P;
end

%Half of the entries in the lower right (M-1)-by-(M-1) matrix
for kk=2:M
    for jj=kk:M
    Useq(:,:,kk,jj) = (Useq(:,:,kk,jj) + P*Useq(:,:,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1)*P)/2;
    Useq(:,:,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1) = P*Useq(:,:,kk,jj)*P;
    end
end
end