function y=smallphi(X,k)
PHI(1)=1;
PHI(2)=X(1)+ 1i*X(2);
PHI(3)=X(3);
PHI(4)=X(1)- 1i*X(2);
y=zeros(1);
 
for m=1:1:4
    y=y+(PHI(m)*exp(-2*pi*1i*k*(m-1)/4));
end
y=y/4;
end