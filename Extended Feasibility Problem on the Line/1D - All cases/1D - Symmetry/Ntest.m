function Out=Ntest(U)
%Norm Test.
%Simply tests if the norm of a matrix is zero.

[~,~,M,N,S]=size(U);

T=zeros(M,N,S);
for xx=1:M
for yy=1:N
    for ss=1:S
        T(xx,yy,ss)=norm(U(:,:,xx,yy,ss),'fro');
        %T=max(T,norm(U(:,:,xx,yy,ss),'fro'));
    end
end
end

Out=sqrt(sum(sum(sum(T.^2))));