function [V1,V2,V3,W1,W2]=initVW(U,a)
[dim,~,M,~]=size(U);
V1=zeros(size(U));
V2=zeros(size(U));
V3=zeros(size(U));
W1=zeros(size(U));
W2=zeros(size(U));

%Create V1
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        J=J+a(kk,j1)*U(:,:,kk,j2);
    end
    V1(:,:,j1,j2)=J;
    
end
end


%Create V2
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        J=J+a(kk,j2)*U(:,:,j1,kk);
    end
    V2(:,:,j1,j2)=J;
    
end
end

%Create V3
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
    for ll=1:M
        J=J+a(ll,j1)*a(kk,j2)*U(:,:,ll,kk);
    end
    end
    V3(:,:,j1,j2)=J;
    
end
end

%Part due to W1
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        if kk~=j1
        J=J+U(:,:,kk,j2)'*V2(:,:,kk,j2);
        end
        if kk~=j2
        J=J+U(:,:,j1,kk)'*V1(:,:,j1,kk);
        end
    end
    
    J=J+(M+1)*U(:,:,j1,j2)'*(V1(:,:,j1,j2)+V2(:,:,j1,j2));
    W1(:,:,j1,j2)=J;
    
end
end

%Part due to W2
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        if kk~=j1
        J=J-1i*cot(pi*(j1-kk)/M)*V2(:,:,kk,j2)'*U(:,:,kk,j2);
        end
        if kk~=j2
        J=J-1i*cot(pi*(j2-kk)/M)*V1(:,:,j1,kk)'*U(:,:,j1,kk);
        end
    end
    
    J=J+2*V3(:,:,j1,j2)'*U(:,:,j1,j2);
    J=J-2*V2(:,:,j1,j2)'*V1(:,:,j1,j2);
    
    W2(:,:,j1,j2)=J;
    
end
end