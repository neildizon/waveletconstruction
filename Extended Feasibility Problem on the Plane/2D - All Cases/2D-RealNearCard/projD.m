function U=projD(U,P0,P1)
%U=projREAL(U);
[~,~,N,~]=size(U);

%Project M0 against the derivative condition
M0=reshape(U(1,1,:,:),[N^2 1]);
U(1,1,:,:)=reshape(P0*M0,[N N]);
% %Refill other cells of M0 in accordance with J/K
% U(2,1,:,:)=circshift(U(1,1,:,:),[0,0,N/2,0]);
% U(3,1,:,:)=circshift(U(1,1,:,:),[0,0,0,N/2]);
% U(4,1,:,:)=circshift(U(1,1,:,:),[0,0,N/2,N/2]);

%Project M1 against the derivative condition
M1=reshape(U(1,2,:,:),[N^2 1]);
U(1,2,:,:)=reshape(P1*M1,[N N]);
% %Refill other cells of M1 in accordance with J/K
% U(2,2,:,:)=circshift(U(1,2,:,:),[0,0,N/2,0]);
% U(3,2,:,:)=circshift(U(1,2,:,:),[0,0,0,N/2]);
% U(4,2,:,:)=circshift(U(1,2,:,:),[0,0,N/2,N/2]);

%Project M2 against the derivative condition
M2=reshape(U(1,3,:,:),[N^2 1]);
U(1,3,:,:)=reshape(P1*M2,[N N]);
% %Refill other cells of M2 in accordance with J/K
% U(2,3,:,:)=circshift(U(1,3,:,:),[0,0,N/2,0]);
% U(3,3,:,:)=circshift(U(1,3,:,:),[0,0,0,N/2]);
% U(4,3,:,:)=circshift(U(1,3,:,:),[0,0,N/2,N/2]);

%Project M3 against the derivative condition
M3=reshape(U(1,4,:,:),[N^2 1]);
U(1,4,:,:)=reshape(P1*M3,[N N]);
% %Refill other cells of M3 in accordance with J/K
% U(2,4,:,:)=circshift(U(1,4,:,:),[0,0,N/2,0]);
% U(3,4,:,:)=circshift(U(1,4,:,:),[0,0,0,N/2]);
% U(4,4,:,:)=circshift(U(1,4,:,:),[0,0,N/2,N/2]);

%Instead of doing separately we can do all further rows together.
%Refill other cells of M0 in accordance with J/K
U(2,:,:,:)=circshift(U(1,:,:,:),[0,0,N/2,0]);
U([3,4],:,:,:)=circshift(U([1,2],:,:,:),[0,0,0,N/2]);
% U(4,:,:,:)=circshift(U(1,:,:,:),[0,0,N/2,N/2]);


