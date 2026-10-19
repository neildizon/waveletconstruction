function Useq=projUJI1(Useq)

[dim,~,M]=size(Useq);
U0=eye(dim);
U0(dim,dim)=Useq(dim,dim,1)/abs(Useq(dim,dim,1));
Useq(:,:,1)=U0;

for dd=1:M/2
    [U,~,V]=svd(Useq(:,:,dd));
    Useq(:,:,dd)=U*V';
end

J=[0,1;1,0];

for dd=1:M/2
    Useq(:,:,M/2+dd)=J*Useq(:,:,dd);
end


