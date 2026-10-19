function Useq=projREAL(Useq)
%J=[0,1;1,0];
[~,~,M]=size(Useq);

%U0(dim,dim)=Useq(dim,dim,1)/abs(Useq(dim,dim,1));

Useq(:,:,1)=real(Useq(:,:,1));
Useq(:,:,M/2+1)=real(Useq(:,:,M/2+1));
for dd = 2:M/2
    Useq(:,:,dd)=(real(Useq(:,:,dd)) + real(Useq(:,:,M+2-dd)))/2 + 1i*(imag(Useq(:,:,dd)) - imag(Useq(:,:,M+2-dd)))/2;
    Useq(:,:,M+2-dd)=conj(Useq(:,:,dd));
end
