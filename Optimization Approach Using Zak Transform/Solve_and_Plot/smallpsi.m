function y=smallpsi(X,k)
PSI(1)=X(3);
PSI(2)=X(4)+ 1i*X(5);
PSI(3)=X(6);
PSI(4)=X(4)- 1i*X(5);
y=zeros(1);
 
for m=1:1:4
    y=y+(PSI(m)*exp(-2*pi*1i*k*(m-1)/4));
end
y=y/4;
end