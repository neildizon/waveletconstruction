function T=Umtest(U)
%Reverse Fouriers to make the original U matrix, then tests at three points
%whether this is unitary
%without using symbolic variables.


[dim,~,M]=size(U);

A=zeros(dim,dim,M);

for kk=1:M
    for nn=1:M
        A(:,:,kk)=A(:,:,kk)+U(:,:,nn)*exp(-2i*pi*(nn-1)*(kk-1)/M);
    end
end
A=A/M;
%disp('U has Fourier coefficients'); disp(reshape(A(1,:,:),[2,4]));
N=100*M;

Out=zeros(dim,dim,N);
for kk=1:M
    for tt=1:N
    Out(:,:,tt)=Out(:,:,tt)+A(:,:,kk)*exp(2i*pi*(kk-1)*  (tt-1)/N  );
    end
end

T=0;
for tt=1:N
    Out(:,:,tt)=double(Out(:,:,tt)'*Out(:,:,tt)-eye(dim));
    T=max(T,norm(Out(:,:,tt),'fro'));
end


