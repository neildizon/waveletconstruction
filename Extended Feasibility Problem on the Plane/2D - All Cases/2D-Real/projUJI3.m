function Useq=projUJI3(Useq)

[dim,~,M,~]=size(Useq);

I=eye(dim);
%Pull out the bottom right of 1,1 matrix, do svd
[U,~,V]=svd(Useq(2:dim,2:dim,1,1));
%Replace this in bottom right corner of I
I(2:dim,2:dim)=U*V';
%Update that back to the U sequence
Useq(:,:,1,1)=I;

%Replace samples in [0,1/2]^2 with their projection onto unitaries 
%Note this projects the (0,0) sample with a unitary, even though we just
%made it unitary separately first. One wasted svd.
for yy=1:M/2
for xx=1:M/2
    [U,~,V]=svd(Useq(:,:,xx,yy));
    Useq(:,:,xx,yy)=U*V';
end
end

%Now replace everything else with JK condition.
I=eye(4);
J=I([2,1,4,3],:);
K=I([3,4,1,2],:);

for yy=1:M/2
for xx=1:M/2
    Useq(:,:,xx+M/2,yy)=J*Useq(:,:,xx,yy);
end
end

for xx=1:M
for yy=1:M/2
    Useq(:,:,xx,yy+M/2)=K*Useq(:,:,xx,yy);
end
end





