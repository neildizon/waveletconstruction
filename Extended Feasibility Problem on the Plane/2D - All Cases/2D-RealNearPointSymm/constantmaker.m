function [a,c,v,d]=constantmaker(M,D)

%%Paraunitary Fourier Coefficients
a=zeros(M,M);
for mm=1:M
    for nn=1:M
        if mm==nn
            a(mm,mm)=0;
        else
           a(mm,nn)=(exp(2i*pi*(nn-mm)/M)-1)^(-1);
       end
    end
end
%The convolution that happens in gradU
c=zeros(M,M);
for jj=1:M
    for mm=1:M
        for nn=1:M
            c(jj,mm)=c(jj,mm)+a(jj,nn)'*a(mm,nn);
        end
    end
end


%%Derivative Foruier Coefficients
%set up a blank matrix
v=zeros(M,D+1);
%The Fourier coefficients for 0 derivatives at 1/2
for jj=1:D+1;
    for ll=1:M;
        for kk=1:M;
            v(ll,jj)=v(ll,jj)+exp(pi*2i*(kk-1)*(1/2-(ll-1)/M))*(kk-1)^(jj-1);
        end
    end
end   
%normalise these vectors
for jj=1:D+1;
    v(:,jj)=v(:,jj)/norm(v(:,jj));
end

d=zeros(M,M);
for nn=1:M
    for ll=1:M
        for dd=1:D+1
            d(nn,ll)=d(nn,ll)+ v(nn,dd)'*v(ll,dd);
        end
    end
end
