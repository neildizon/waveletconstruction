function U=projAVER(Useq)
%Weighting for derivative condition (integer)
w=0;
%Find average and put it in each cell of U
n=size(Useq,5);
A=(sum(Useq,5)+w*Useq(:,:,:,:,5))/(n+w);
U=cat(5,A,A,A,A,A);


