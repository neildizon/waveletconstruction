function Useq=projUh2(Useq)

LL=[1/2,1/2];
%Create Fourier Coefficients A_k
%Note:This assumes input satisfied J/K condition
A = myIDFT(Useq);
[dim,~,M,~]=size(A);


%Create samples at half points
%Uhalf=myDFT(chimodulate(A,[1/2,1/2]));

I=eye(8,8);
J=I([3 4 1 2 7 8 5 6],:);
K=I([5 6 7 8 1 2 3 4],:);
Uhalf=zerosq(dim,dim,M,M);

for jj=1:M
for kk=1:M
    for ll=1:M/2
    for nn=1:M/2
        Uhalf(:,:,ll,nn)=Uhalf(:,:,ll,nn)+kernel([ll-1+LL(1),nn-1+ LL(2)],[jj-1,kk-1],M)*A(:,:,jj,kk);
    end
    end
end
end
%Create rest of samples using J/K
for ll=1:M/2
for nn=1:M/2
    Uhalf(:,:,ll+M/2,nn)=J*Uhalf(:,:,ll,nn);
    Uhalf(:,:,ll,nn+M/2)=K*Uhalf(:,:,ll,nn);
    Uhalf(:,:,ll+M/2,nn+M/2)=J*K*Uhalf(:,:,ll,nn);
end
end


%Make these samples at half points unitary
Uhalf=projUNIT(Uhalf);

%Recompute the original coefficients coefficients
% XA = myIDFT(Uhalf);
% A = chimodulate(XA,[-1/2,-1/2]);
A=zerosq(dim,dim,M,M);
for jj=1:M
for kk=1:M
    for ll=1:M/2
    for nn=1:M/2
        A(:,:,jj,kk)=A(:,:,jj,kk)+...
            (I*kernel([jj-1,kk-1],[ll-1+LL(1),nn-1+LL(2)],M)...
            +J*kernel([jj-1,kk-1],[ll+M/2-1+LL(1),nn-1+LL(2)],M)...
            +K*kernel([jj-1,kk-1],[ll-1+LL(1),nn+M/2-1+LL(2)],M)...
            +K*J*kernel([jj-1,kk-1],[ll+M/2-1+LL(1),nn+M/2-1+LL(2)],M))...   
            *Uhalf(:,:,ll,nn);
    end
    end
end
end
A=A/M^2;




%Reconstitute the original sample points
Useq = myDFT(A);



