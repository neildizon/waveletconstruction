function [B0,B1,B2,B3]=U2A(U)

%Create Fourier Coefficients A_k
A = myIDFT2(U);
[~,~,M,~]=size(U);


B0 = reshape(A(1,1,:,:)+A(1,2,:,:),[M M]);
B1 = reshape(A(1,3,:,:)+A(1,4,:,:),[M M]);
B2 = reshape(A(1,5,:,:)+A(1,6,:,:),[M M]);
B3 = reshape(A(1,7,:,:)+A(1,8,:,:),[M M]);

end
