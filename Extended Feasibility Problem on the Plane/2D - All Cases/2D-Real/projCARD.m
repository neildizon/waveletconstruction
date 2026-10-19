function U=projCARD(Useq,deviation,J1,J2)
[~,~,~,M]=size(Useq);
U=Useq;
%Get the first entry of every page of every book
%Put it in an M-by-M matrix whose (j,k) entry corresponds to
%a sample of U at (j-1,k-1)/M. 
C = reshape(Useq(1,1,:,:),[M,M]);


%Project half of the entries in the lower right (M-1)-by-(M-1) matrix
for kk=1:M/2
    for jj = 1:M/2
    a = [1,(-1)^J1,(-1)^J2, (-1)^(J1+J2)];
    z = [C(kk,jj), C(kk+M/2,jj), C(kk,jj+M/2), C(kk+M/2,jj+M/2)];
    b = -exp(2*pi*1i*dot([J1,J2],[kk-1,jj-1])/M);
    Z = projcirclecard(a,b,z,deviation);
    C(kk,jj) = Z(1);
    C(kk+M/2,jj) = Z(2);
    C(kk,jj+M/2) = Z(3);
    C(kk+M/2,jj+M/2) = Z(4);
    end
end

D = reshape(C,[1,1,M,M]);
U(1,1,:,:) = D;
U(2,1,:,:)= circshift(U(1,1,:,:),[0,0,M/2,0]);
U([3,4],1,:,:) = circshift(U([1,2],1,:,:),[0,0,0,M/2]);
end


