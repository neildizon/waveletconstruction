function U=projQUAD(U,P0,P1)
%This function is called projQUAD because when you're stressed out 4=5
%sometimes.

%unitary at full points
U(:,:,:,:,1)=projUJI3(U(:,:,:,:,1));
%unitary at x/y shifted half points
U(:,:,:,:,2)=projUh(U(:,:,:,:,2));
%unitary at x shifted half points
U(:,:,:,:,3)=projUx(U(:,:,:,:,3));
%unitary at y shifted half points
U(:,:,:,:,4)=projUy(U(:,:,:,:,4));
%derivative condition
U(:,:,:,:,5)=projD(U(:,:,:,:,5),P0,P1);
U(:,:,:,:,6)=projCARD(U(:,:,:,:,6),0.3,1,1);
U(:,:,:,:,7)=projREAL(U(:,:,:,:,7));

% function U=projQUAD(U,P0,P1)
% parfor i=1:6
% if i==1
% U(:,:,:,:,i)=projUJI3(U(:,:,:,:,i));
% elseif i==2
% U(:,:,:,:,i)=projUh(U(:,:,:,:,i));
% elseif i==3
% U(:,:,:,:,i)=projUx(U(:,:,:,:,i));
% elseif i==4
% U(:,:,:,:,i)=projUy(U(:,:,:,:,i));
% elseif i==5
% U(:,:,:,:,i)=projD(U(:,:,:,:,i),P0,P1);
% elseif i==6
% U(:,:,:,:,i)=projREAL(U(:,:,:,:,i));
% end
% end

