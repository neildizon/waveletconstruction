function U=MtoU(M)


[N,~,~]=size(M);
if ismatrix(M)
    
        %1D case
        %M(x,id)>U(row,col,x)
    U(1,:,:)=permute(M,[2,1]);
    U(2,:,:)=circshift(U(1,:,:),[0 0 N/2]);
else
            %2D case
        %M(x,y,id)>U(row,col,x,y)
    U(1,:,:,:)=permute(M,[3,1,2]);
    U(2,:,:,:)=circshift(U(1,:,:,:),[0 0 N/2 0]);
    U(3,:,:,:)=circshift(U(1,:,:,:),[0 0 0 N/2]);
    U(4,:,:,:)=circshift(U(1,:,:,:),[0 0 N/2 N/2]);
    
end

end
    




