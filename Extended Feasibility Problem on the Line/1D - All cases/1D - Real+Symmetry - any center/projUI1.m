function Useq=projUI1(Useq)

[dim,~,degree]=size(Useq);
U0=eye(dim);
U0(dim,dim)=Useq(dim,dim,1)/abs(Useq(dim,dim,1));
Useq(:,:,1)=U0;

for dd=1:degree
    [U,~,V]=svd(Useq(:,:,dd));
    Useq(:,:,dd)=U*V';
end

