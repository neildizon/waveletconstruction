function U=projAVER(Useq)

U=zeros(size(Useq));
for jj=1:5
U(:,:,:,jj)=sum(Useq,4)/5;
end

