function Mlist=MtoMlist(M)

[N,~,~]=size(M);

%2D case
%M(x,y,id)>Mlist(x/y,id)
Mlist=reshape(M,[N^2,4]);

end
