function U=init(M)
dim=4;

I=eye(4);
J=I([2,1,4,3],:);
K=I([3,4,1,2],:);
%Fill in U with random matrices satisfying JK condition
U=zeros(dim,dim,M,M);
for yy=1:M/2
for xx=1:M/2
    U(:,:,xx,yy)=2*rand(dim,dim)+2i*rand(dim,dim)-1-1i;
    U(:,:,xx+M/2,yy)=J*U(:,:,xx,yy);
    U(:,:,xx,yy+M/2)=K*U(:,:,xx,yy);
    U(:,:,xx+M/2,yy+M/2)=J*K*U(:,:,xx,yy);
end
end

