function A = myIDFT(Useq)


%Convert to A_k then make new samples
[dim,~,M,~]=size(Useq);
I=eye(8,8);
J=I([3 4 1 2 7 8 5 6],:);
K=I([5 6 7 8 1 2 3 4],:);


%Create Fourier Coefficients A_k
%Note:This assumes input satisfied J/K condition
A=zerosq(dim,dim,M,M);

for jj=1:M
for kk=1:M
    for ll=1:M/2
    for nn=1:M/2
        A(:,:,jj,kk)=A(:,:,jj,kk)+...
            (I*kernel([jj-1,kk-1],[ll-1,nn-1],M)...
            +J*kernel([jj-1,kk-1],[ll+M/2-1,nn-1],M)...
            +K*kernel([jj-1,kk-1],[ll-1,nn+M/2-1],M)...
            +K*J*kernel([jj-1,kk-1],[ll+M/2-1,nn+M/2-1],M))...   
            *Useq(:,:,ll,nn);
    end
    end
end
end
A=A/M^2;
end