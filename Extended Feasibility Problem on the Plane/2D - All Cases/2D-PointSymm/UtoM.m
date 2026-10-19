function M=UtoM(U)


if ndims(U)==3
        %1D case
        %U(row,col,x)>M(x,id)
        M=permute(U(1,:,:),[3,2,1]);
else
        %2D case
        %U(row,col,x,y)>M(x,y,id)
        M=permute(U(1,:,:,:),[3,4,2,1]);
end


end



