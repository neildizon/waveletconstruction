function Useq=projUJ(Useq)

[~,~,M]=size(Useq);

for dd=1:M/2
    Useq(:,:,dd) = (Useq(:,:,dd)+[0,1;1,0]*Useq(:,:,M/2+dd))/2;
    Useq(:,:,M/2 + dd)= [0 1; 1 0]*Useq(:,:,dd);
end

