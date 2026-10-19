function Useq=projUNIT(Useq)
[~,~,M,~]=size(Useq);
I=eye(8,8);
J=I([3 4 1 2 7 8 5 6],:);
K=I([5 6 7 8 1 2 3 4],:);

for yy=1:M/2
for xx=1:M/2
    [U,~,V]=svSVD(Useq(:,:,xx,yy));
    Useq(:,:,xx,yy)=U*V';
end
end


for yy=1:M/2
for xx=1:M/2
    Useq(:,:,xx+M/2,yy)=J*Useq(:,:,xx,yy);
    Useq(:,:,xx,yy+M/2)=K*Useq(:,:,xx,yy);
    Useq(:,:,xx+M/2,yy+M/2)=J*K*Useq(:,:,xx,yy);
end
end