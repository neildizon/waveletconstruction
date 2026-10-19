function U=projAVER(Useq)

U=zeros(size(Useq));
for jj=1:4
U(:,:,:,jj)=sum(Useq,4)/4;
end

