function U=projQUAD(U,P0,P1)
%This function is called projQUAD because when you're stressed out 4=5
%sometimes.


parfor i=1:5
%unitary at full points
if i==1
U(:,:,:,:,i)=projUJKP2(U(:,:,:,:,i));

elseif i==2
%unitary at x/y shifted half points
U(:,:,:,:,i)=projUh2(U(:,:,:,:,i));

elseif i==3
%unitary at x shifted half points
U(:,:,:,:,i)=projUx2(U(:,:,:,:,i));

elseif i==4
%unitary at y shifted half points
U(:,:,:,:,i)=projUy2(U(:,:,:,:,i));

elseif i==5
%derivative condition
U(:,:,:,:,i)=projDqQ(U(:,:,:,:,i),P0,P1);
end
end


