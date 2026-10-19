function Useq=projUy(Useq)

%Convert to A_k then make new samples
[dim,~,M,~]=size(Useq);

I=eye(dim);
J=I([2,1,4,3],:);
K=I([3,4,1,2],:);

%Create Fourier Coefficients A_k
%Note:This assumes input satisfied J/K condition
A=zeros(dim,dim,M,M);

for kk=1:M
for jj=1:M
    for ll=1:M/2
    for nn=1:M/2
        A(:,:,jj,kk)=A(:,:,jj,kk)+...
            (I*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M)...
             +J*exp(-2i*pi*((kk-1)*(ll+M/2-1)+(jj-1)*(nn-1))/M)...
             +K*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn+M/2-1))/M)...
             +K*J*exp(-2i*pi*((kk-1)*(ll+M/2-1)+(jj-1)*(nn+M/2-1))/M))...
             *Useq(:,:,ll,nn);
    end
    end
end
end
A=A/M^2;


%Create samples at half points
Uhalf=zeros(dim,dim,M,M);
for kk=1:M
for jj=1:M
    for ll=1:M/2
    for nn=1:M/2
        Uhalf(:,:,ll,nn)=Uhalf(:,:,ll,nn)+A(:,:,jj,kk)*exp(2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1/2))/M);
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

    %Unitary projection on half points
    %Test if UJ and U are the same
    %       U=projU(Uhalf);
    Uhalf=projUJ(Uhalf);
%     Ctest(U,Uhalf) %They are

    %Now to reconstitute the whole samples
    %Create Fourier Coefficients A_k
 A=zeros(dim,dim,M,M);
for kk=1:M
for jj=1:M
    for ll=1:M/2
    for nn=1:M/2
        A(:,:,jj,kk)=A(:,:,jj,kk)+...
            (I*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1/2))/M)+...
            J*exp(-2i*pi*((kk-1)*(ll+M/2-1)+(jj-1)*(nn-1/2))/M)+...
            K*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn+M/2-1/2))/M)+...
            J*K*exp(-2i*pi*((kk-1)*(ll+M/2-1)+(jj-1)*(nn+M/2-1/2))/M))...
            *Uhalf(:,:,ll,nn);
        
    end
    end
end
end
A=A/M^2;

    %Recreate U samples at main points
Useq=zeros(dim,dim,M,M);
for kk=1:M
for jj=1:M
    for ll=1:M/2
    for nn=1:M/2
        Useq(:,:,ll,nn)=Useq(:,:,ll,nn)+A(:,:,jj,kk)*exp(2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
    end
    end
end
end
%Create rest of samples using J/K
for ll=1:M/2
for nn=1:M/2
    Useq(:,:,ll+M/2,nn)=J*Useq(:,:,ll,nn);
    Useq(:,:,ll,nn+M/2)=K*Useq(:,:,ll,nn);
    Useq(:,:,ll+M/2,nn+M/2)=J*K*Useq(:,:,ll,nn);
end
end
    
    
    

