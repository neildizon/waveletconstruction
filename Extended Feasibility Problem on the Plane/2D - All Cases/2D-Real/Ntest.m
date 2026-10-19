function Out=Ntest(U)
%Norm Test.
%Finds the norm of a matrix ensemble, which is just the
%sqrt(sum(abs(a)^2))) for every single entry.

%Attempted to make use of the standard Frobenius norm on each 4x4 matrix in
%case that calculates any faster.

[~,~,M,N,S]=size(U);

T=zeros(M,N,S);
for xx=1:M
for yy=1:N
    for ss=1:S
        T(xx,yy,ss)=norm(U(:,:,xx,yy,ss),'fro')^2;
        %T=max(T,norm(U(:,:,xx,yy,ss),'fro'));
    end
end
end

Out=sqrt(sum(sum(sum(T))));



