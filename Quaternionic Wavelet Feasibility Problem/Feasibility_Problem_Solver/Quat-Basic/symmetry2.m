function U=symmetry2(Useq,deviation)
[~,~,~,M]=size(Useq);
U=Useq;
%Get the first entry of every page of every book
%Put it in an M-by-M matrix whose (j,k) entry corresponds to
%a sample of U at (j-1,k-1)/M. 
C = reshape(Useq(1,1,:,:),[M M]);
CC = reshape(x(Useq(1,2,:,:)) + y(Useq(1,2,:,:))*qk,[M M]);

%Project half of first row
for kk=1:M/2+1
a=[1,-exp(-2*pi*qk*wedge([1-1,kk-1],[M-1,M-1])/M)];
zz=[C(1,kk),C(1,mod(M-(kk-1),M)+1)];
zzz=[CC(1,kk),CC(1,mod(M-(kk-1),M)+1)];
Z=projcircle(a,zz,deviation);
ZZ=projcircle(a,zzz,deviation);
C(1,kk)=Z(1);
C(1,mod(M-(kk-1),M)+1)=Z(2);
CC(1,kk)=ZZ(1);
CC(1,mod(M-(kk-1),M)+1)=ZZ(2);
end

%Project half of the first column
for jj=2:M/2+1
a=[1,-exp(-2*pi*qk*wedge([jj-1,1-1],[M-1,M-1])/M)];
zz=[C(jj,1),C(mod(M-(jj-1),M)+1,1)];
zzz=[CC(jj,1),CC(mod(M-(jj-1),M)+1,1)];
Z=projcircle(a,zz,deviation);
ZZ=projcircle(a,zzz,deviation);
C(jj,1)=Z(1);
C(mod(M-(jj-1),M)+1,1)=Z(2);   
CC(jj,1)=ZZ(1);
CC(mod(M-(jj-1),M)+1,1)=ZZ(2);   
end


%Project half of the entries in the lower right (M-1)-by-(M-1) matrix
for kk=2:M
    for jj = kk:M
    a = [1,-exp(-2*pi*qk*wedge([kk-1,jj-1],[M-1,M-1])/M)];
    zz = [C(kk,jj),C(mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1)];
    zzz = [CC(kk,jj),CC(mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1)];
    Z = projcircle(a,zz,deviation);
    ZZ = projcircle(a,zzz,deviation);
    C(kk,jj) = Z(1);
    C(mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1)=Z(2);  
    CC(kk,jj) = ZZ(1);
    CC(mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1)=ZZ(2);  
    end
end

D = reshape(C,[1,1,M,M]);
DD = reshape(CC*qi,[1,1,M,M]);
U(1,1,:,:) = D;
U(1,2,:,:) = DD;

%First row
for kk=1:M
    U(2,1,1,kk) =  U(1,2,1,mod(M-(kk-1),M)+1);
    U(2,2,1,kk) =  U(1,1,1,mod(M-(kk-1),M)+1);
end

%First column
for jj=2:M
    U(2,1,jj,1) =  U(1,2,mod(M-(jj-1),M)+1,1);
    U(2,2,jj,1) =  U(1,1,mod(M-(jj-1),M)+1,1);
end

%Half of the entries in the lower right (M-1)-by-(M-1) matrix
for kk=2:M
    for jj=2:M
    U(2,1,kk,jj) = U(1,2,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1);
    U(2,2,kk,jj) = U(1,1,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1);
    end
end


U([3,4],[1,2],:,:)= circshift(U([1,2],[1,2],:,:),[0,0,M/2,0]);
U([5,6,7,8],[1,2],:,:) = circshift(U([1,2,3,4],[1,2],:,:),[0,0,0,M/2]);

end


