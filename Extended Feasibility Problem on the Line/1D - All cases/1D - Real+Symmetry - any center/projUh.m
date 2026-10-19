function Useq=projUh(Useq)

%Convert to A_k then make new samples
[dim,~,M]=size(Useq);

%Create Fourier Coefficients A_k
A=zeros(dim,dim,M);
for kk=1:M
    for nn=1:M
        A(:,:,kk)=A(:,:,kk)+Useq(:,:,nn)*exp(-2i*pi*(nn-1)*(kk-1)/M);
    end
end
A=A/M;

%Create samples at half points

Uhalf=zeros(dim,dim,M);
for kk=1:M
    for nn=1:M
        Uhalf(:,:,nn)=Uhalf(:,:,nn)+A(:,:,kk)*exp(2i*pi*(kk-1)*(nn-1/2)/M);
    end
end


%Unitary projection on half points
for dd=1:M/2
    [U,~,V]=svd(Uhalf(:,:,dd));
    Uhalf(:,:,dd)=U*V';
end

J=[0,1;1,0];

for dd=1:M/2
    Uhalf(:,:,M/2+dd)=J*Uhalf(:,:,dd);
end

%Now to reconstitute the whole samples
%Create Fourier Coefficients A_k
A=zeros(dim,dim,M);
for kk=1:M
    for nn=1:M
        A(:,:,kk)=A(:,:,kk)+Uhalf(:,:,nn)*exp(-2i*pi*(kk-1)*(nn-1/2)/M);
    end
end
A=A/M;

%Create U samples at main points
Useq=zeros(dim,dim,M);
for kk=1:M
    for nn=1:M
        Useq(:,:,nn)=Useq(:,:,nn)+A(:,:,kk)*exp(2i*pi*(nn-1)*(kk-1)/M);
    end
end


% 
%  Useq(:,:,1)=[1,0;0,1];
%  Useq(:,:,3)=[0,1;1,0];