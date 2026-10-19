function Useq=projaH(Useq)

[dim,~,M,~]=size(Useq);

for xx=1:M
for yy=1:M
    Useq(:,:,xx,yy)=(Useq(:,:,xx,yy)-Useq(:,:,xx,yy)')/2;
end
end
