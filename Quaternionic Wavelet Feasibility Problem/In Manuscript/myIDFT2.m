function A = myIDFT2(Useq)


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
    for ll=1:M
    for nn=1:M
        A([1 2],:,jj,kk)=A([1 2],:,jj,kk) + kernel2([jj-1,kk-1],[ll-1,nn-1],M)*Useq([1 2],:,ll,nn);
    end
    end
end
end
A=A/M^2;
end