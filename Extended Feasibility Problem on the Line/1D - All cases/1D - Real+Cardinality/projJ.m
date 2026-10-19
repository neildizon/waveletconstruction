function Out=projJ(U)
%works only for the 1D case for now
[dim,~,N]=size(U);


Out=(U+circshift(U,[1,0,N/2]))/2;
% Out(:,:,1)=eye(2);
% Out(:,:,3)=[0,1;1,0];
end


