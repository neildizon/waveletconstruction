function M=MlisttoM(Mlist)

[N2,~]=size(Mlist);
N=sqrt(N2);
%2D case
%Mlist(x/y,id)>M(x,y,id)
M=reshape(Mlist,[N,N,4]);

end
