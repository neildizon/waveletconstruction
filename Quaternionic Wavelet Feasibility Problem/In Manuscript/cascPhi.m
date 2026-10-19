function [Phi,X1,X2]=cascPhi(Phi,X1,X2,a,n)

[~,M]=size(a);
X=X1(1,:);

for i=1:n
    step=X(2)-X(1);
    Xn=X(1):step/2:X(end);
    [~,m]=size(Xn);

    Phin=zerosq(m,m);
    for i1=1:m
    for i2=1:m
        x1=Xn(i1);
        x2=Xn(i2);

        xo1=find(X==x1,1);
        xo2=find(X==x2,1);

        if ~isempty(xo1) && ~isempty(xo2)
            Phin(i1,i2)=Phi(xo1,xo2);
        else
            for k1=1:M
            for k2=1:M

            xo1=find(X==2*x1-k1+1,1);
            xo2=find(X==2*x2-k2+1,1);

                if ~isempty(xo1) && ~isempty(xo2)
                    Phin(i1,i2)=Phin(i1,i2)+4*Phi(xo1,xo2)*a(k1,k2);
                end

            end
            end

        end
    end
    end

    X=Xn;
    Phi=Phin;

end

[X1,X2]=meshgrid(X);

