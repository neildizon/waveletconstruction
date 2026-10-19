function N=Dtest(U,D)
%Reverse Fouriers to make the original U matrix, then tests at three points
%whether this is unitary
%without using symbolic variables.


[~,~,M]=size(U);

A=zeros(D+1,M);
%Force m0's derivatives to be 0 at 1/2
for J=1:D+1;
    for L=1:M;
        for K=1:M;
            A(J,L)=A(J,L)+exp(pi*2i*(K-1)*(1/2-(L-1)/M))*(K-1)^(J-1);
        end
    end
end

%normalise these vectors
for jj=1:D+1;
    A(jj,:)=A(jj,:)/norm(A(jj,:));
end


B=zeros(D+1,M);
%Force m1's derivatives to be 0 at 0
for J=1:D+1;
    for L=1:M;
        for K=1:M;
            B(J,L)=B(J,L)+exp(-pi*2i*(K-1)*(L-1)/M)*(K-1)^(J-1);
        end
    end
end

%normalise these vectors
for jj=1:D+1;
    B(jj,:)=B(jj,:)/norm(B(jj,:));
end


%pull out m0
M=UtoM(U);
%find norm of the image of m0 under A
N=norm(A*M(:,1),'fro')+norm(B*M(:,2),'fro');


