function Out=Umtest(U)
%Unitary at many points Test
%Uses Fourier Transform to assume a trigonometric polynomial and resamples
%at the half points and tests if it is unitary at those hlaf points.


[dim,~,M,~]=size(U);

A=zeros(dim,dim,M,M);
        for kk=1:M
        for jj=1:M
        for ll=1:M
        for nn=1:M
            A(:,:,jj,kk)=A(:,:,jj,kk)+U(:,:,ll,nn)*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
        end
        end
        end
        end
    A=A/M^2;
%disp('U has Fourier coefficients'); disp(reshape(A(1,:,:),[2,4]));
%Create samples at half points

Uhalf=zeros(dim,dim,4*M,4*M);
for kk=1:M
for jj=1:M
    for ll=1:4*M
    for nn=1:4*M
        Uhalf(:,:,ll,nn)=Uhalf(:,:,ll,nn)+A(:,:,jj,kk)*exp(2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/(4*M));
    end
    end
end
end

N=0;
    for ll=1:4*M
    for nn=1:4*M
        Uhalf(:,:,ll,nn)=Uhalf(:,:,ll,nn)'*Uhalf(:,:,ll,nn)-eye(dim);
        N=N+norm(Uhalf(:,:,ll,nn),'fro')^2;
    end
    end


Out=sqrt(N);


% 
% if N<tol
%    disp(['Unitary at offset points (Diff=',num2str(N),')']) 
%    Out=0;
% else
%    warning(['Not Unitary at offset points (Diff=',num2str(N),')']) 
%    Out=1;
% end