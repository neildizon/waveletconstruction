function Out=initU(M)
dim=4;
%Pick a random, single A_k to be nonzero
kk=randi(M)-1;
jj=randi(M)-1;
%Make that A_k be a random unitary matrix
A=rand(dim)+1i*rand(dim)-1-1i;
[U,~,V]=svd(A);
A=U*V';

%Produce M^2 samples
Out=zeros(dim,dim,M,M);
for xx=1:M
for yy=1:M 
    Out(:,:,xx,yy)=A*exp(2i*pi*(kk*(xx-1)/M+jj*(yy-1)/M));
    %Out(:,:,xx,yy)=subs(subs(A,xi,(xx-1)/M),yi,(yy-1)/M);
end
end

