function [Psi,X1,X2]=cascPsi(Phi,X1,X2,b)

[~,M]=size(b);
X=X1(1,:);

[~,m]=size(X);

Psi=zeros(m,m);
for i1=1:m
for i2=1:m
for k1=1:M
for k2=1:M
    x1=X(i1);
    x2=X(i2);

    xo1=find(X==2*x1-k1+1);
    xo2=find(X==2*x2-k2+1);

    if ~isempty(xo1) && ~isempty(xo2)
        Psi(i1,i2)=Psi(i1,i2)+4*b(k1,k2)*Phi(xo1,xo2);
    end



end
end
end
end



    
    
    
