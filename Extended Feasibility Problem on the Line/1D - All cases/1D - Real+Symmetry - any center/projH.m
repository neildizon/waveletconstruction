function Useq=projH(Useq)

[dim,~,degree]=size(Useq);

for dd=1:degree
    Useq(:,:,dd)=(Useq(:,:,dd)+Useq(:,:,dd)')/2;
end