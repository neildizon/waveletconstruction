function U=projDqQ(Useq,P,Ph)

%[P,Ph] = projDmatrix(6,2);
%P is for the wavelet filters
%Ph is for the scaling filter

[~,~,N,~]=size(Useq);
M=N;
A=Useq;

M0=reshape((A(1,1,:,:)+A(1,2,:,:)),[N^2 1]);
A0=reshape(Ph*M0,[N N]);
A0s=s(A0) + z(A0)*qk;
A0v=x(A0)*qi + y(A0)*qj;
A(1,1,:,:)=A0s;
%A(2,2,:,:)=A0s;
A(1,2,:,:)=A0v;
%A(2,1,:,:)=A0v;

M1=reshape((A(1,3,:,:)+A(1,4,:,:)),[N^2 1]);
A1=reshape(P*M1,[N N]);
A1s=s(A1) + z(A1)*qk;
A1v=x(A1)*qi + y(A1)*qj;
A(1,3,:,:)=A1s;
%A(2,4,:,:)=A1s;
A(1,4,:,:)=A1v;
%A(2,3,:,:)=A1v;

M2=reshape((A(1,5,:,:)+A(1,6,:,:)),[N^2 1]);
A2=reshape(P*M2,[N N]);
A2s = s(A2) + z(A2)*qk;
A2v = x(A2)*qi + y(A2)*qj;
A(1,5,:,:)=A2s;
%A(2,6,:,:)=A2s;
A(1,6,:,:)=A2v;
%A(2,5,:,:)=A2v;


M3=reshape((A(1,7,:,:)+A(1,8,:,:)),[N^2 1]);
A3=reshape(P*M3,[N N]);
A3s = s(A3) + z(A3)*qk;
A3v = x(A3)*qi + y(A3)*qj;
A(1,7,:,:)=A3s;
%A(2,8,:,:)=A3s;
A(1,8,:,:)=A3v;
%A(2,7,:,:)=A3v;

for kk=1:M
    A(2,1:2:8,1,kk) =  A(1,2:2:8,1,mod(M-(kk-1),M)+1);
    A(2,2:2:8,1,kk) =  A(1,1:2:8,1,mod(M-(kk-1),M)+1);
end

%First column
for jj=2:M
    A(2,1:2:8,jj,1) =  A(1,2:2:8,mod(M-(jj-1),M)+1,1);
    A(2,2:2:8,jj,1) =  A(1,1:2:8,mod(M-(jj-1),M)+1,1);
end

%Half of the entries in the lower right (M-1)-by-(M-1) matrix
for kk=2:M
    for jj=2:M
    A(2,1:2:8,kk,jj) = A(1,2:2:8,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1);
    A(2,2:2:8,kk,jj) = A(1,1:2:8,mod(M-(kk-1),M)+1,mod(M-(jj-1),M)+1);
    end
end

U=A;

%Instead of doing separately we can do all further rows together.
%Refill other cells of M0 in accordance with J/K
U([3 4],:,:,:)=circshift(U([1 2],:,:,:),[0,0,N/2,0]);
U([5 6 7 8],:,:,:)=circshift(U([1 2 3 4],:,:,:),[0,0,0,N/2]);

