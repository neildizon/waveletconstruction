function C = CC(Ck,x)
%Ck should contain index in first column, and coeff value at index in second col
%This function will access value of C0 at an  'righful' index x
%Will be zero in other indices that are not in the first col of Ck

if ismember(x,Ck(:,1))
    C=Ck(find(Ck(:,1)==x),2);
else
    C=0;
end
end
