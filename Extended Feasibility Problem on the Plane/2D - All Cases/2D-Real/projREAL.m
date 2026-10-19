function Useq = projREAL(U)
[~,~,~,M]=size(U);
Useq=U;
%First row
for kk=1:M/2+1
    Useq(:,:,1,kk) = real((Useq(:,:,1,kk) + Useq(:,:,1,mod(M-(kk-1),M)+1)))/2 + 1i*imag((Useq(:,:,1,kk) - Useq(:,:,1,mod(M-(kk-1),M)+1)))/2 ;
    Useq(:,:,1,mod(M-(kk-1),M)+1) = conj(Useq(:,:,1,kk));
end

%First column
for jj=2:M/2+1
    Useq(:,:,jj,1) = real((Useq(:,:,jj,1) + Useq(:,:,mod(M-(jj-1),M)+1,1)))/2 + 1i*imag((Useq(:,:,jj,1) - Useq(:,:,mod(M-(jj-1),M)+1,1)))/2;
    Useq(:,:,mod(M-(jj-1),M)+1,1) = conj(Useq(:,:,jj,1));
end

%Half of the entries in the lower right (M-1)-by-(M-1) matrix
for kk=2:M
    for jj=kk:M
    Useq(:,:,kk,jj) = real((Useq(:,:,kk,jj) + Useq(:,:,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1)))/2 + 1i*imag((Useq(:,:,kk,jj) - Useq(:,:,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1)))/2;
    Useq(:,:,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1) = conj(Useq(:,:,kk,jj));
    end
end
end