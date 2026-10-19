function U=symmetry2(Useq,deviation)
[~,~,~,M]=size(Useq);
U=Useq;
%Get the first entry of every page of every book
%Put it in an M-by-M matrix whose (j,k) entry corresponds to
%a sample of U at (j-1,k-1)/M. 
C = reshape(Useq(1,1,:,:),[M,M]);


%Project first row
for kk=1:M
a=[1,-exp(-2*pi*1i*dot([1-1,kk-1],[M-1,0])/M)];
z=[C(1,kk),C(1,kk)];
Z=projcircle(a,z,deviation);
C(1,kk)=Z(1);
end


%Project half of the entries in the lower right (M-1)-by-(M-1) matrix
for kk=2:M/2+1
    for jj = 1:M
    a = [1,-exp(-2*pi*1i*dot([kk-1,jj-1],[M-1,0])/M)];
    z = [C(kk,jj),C(M+2-kk,jj)];
    Z = projcircle(a,z,deviation);
    C(kk,jj) = Z(1);
    C(M+2-kk,jj)=Z(2);  
    end
end

D = reshape(C,[1,1,M,M]);
U(1,1,:,:) = D;
U(2,1,:,:)= circshift(U(1,1,:,:),[0,0,M/2,0]);
U([3,4],1,:,:) = circshift(U([1,2],1,:,:),[0,0,0,M/2]);
end


