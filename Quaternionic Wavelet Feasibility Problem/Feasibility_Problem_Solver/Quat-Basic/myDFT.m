function Useq=myDFT(A)
%This only works correctly when A satisfies the consistency conditions

[dim,~,M,~]=size(A);
I=eye(8,8);
J=I([3 4 1 2 7 8 5 6],:);
K=I([5 6 7 8 1 2 3 4],:);

Useq=zerosq(dim,dim,M,M);

for jj=1:M
for kk=1:M
    for ll=1:M/2
    for nn=1:M/2
        Useq(:,:,ll,nn)=Useq(:,:,ll,nn)+kernel([ll-1,nn-1],[jj-1,kk-1],M)*A(:,:,jj,kk);
    end
    end
end
end
%Create rest of samples using J/K
for ll=1:M/2
for nn=1:M/2
    Useq(:,:,ll+M/2,nn)=J*Useq(:,:,ll,nn);
    Useq(:,:,ll,nn+M/2)=K*Useq(:,:,ll,nn);
    Useq(:,:,ll+M/2,nn+M/2)=J*K*Useq(:,:,ll,nn);
end
end
%Useq=projP(Useq);
end