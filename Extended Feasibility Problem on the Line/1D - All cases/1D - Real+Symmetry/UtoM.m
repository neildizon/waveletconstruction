function M=UtoM(U)

[dim,~,degree]=size(U);
switch dim
    case 2
        %1D case
        %U(row,col,x)>M(x,id)
        M=permute(U(1,:,:),[3,2,1]);
    case 4
        %2D case
        %U(row,col,x,y)>M(y,x,id)
        M=permute(U(1,:,:,:),[4,3,2,1]);
    otherwise
        error('Conversion target makes no sense')
end



