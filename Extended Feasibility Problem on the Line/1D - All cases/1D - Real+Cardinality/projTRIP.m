function Useq=projTRIP(Useq,D)
Useq(:,:,:,1)=projUJI1(Useq(:,:,:,1));
Useq(:,:,:,2)=projUh(Useq(:,:,:,2));
Useq(:,:,:,3)=projD(Useq(:,:,:,3),D);
Useq(:,:,:,4)=card(Useq(:,:,:,4),0.3,1);
Useq(:,:,:,5)=projREAL(Useq(:,:,:,5));


