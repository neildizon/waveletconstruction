function Ustart=randomstart(M)


I=eye(4);
J=I([2,1,4,3],:);
K=I([3,4,1,2],:);


Useq=rand(4,4,M,M)+rand(4,4,M,M)*1i;



for xx=1:M/2
for yy=1:M/2
    Useq(:,:,xx+M/2,yy)=J*Useq(:,:,xx,yy);
    Useq(:,:,xx,yy+M/2)=K*Useq(:,:,xx,yy);
    Useq(:,:,xx+M/2,yy+M/2)=J*K*Useq(:,:,xx,yy);
end
Ustart=Useq;
end
