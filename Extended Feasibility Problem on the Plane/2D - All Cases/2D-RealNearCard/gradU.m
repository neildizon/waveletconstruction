function Out=gradU(U,V1,V2,V3,W1,W2,a,c)

[dim,~,M,~]=size(U);
Out=zeros(size(U));

%Part due to V1
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        J=J+c(j1,kk)*U(:,:,kk,j2)-a(j1,kk)'*V1(:,:,kk,j2);
    end
    
    Out(:,:,j1,j2)=Out(:,:,j1,j2)+J;
    
end
end

%Part due to V2
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        J=J+c(j2,kk)*U(:,:,j1,kk)-a(j2,kk)'*V2(:,:,j1,kk);
    end
    
    Out(:,:,j1,j2)=Out(:,:,j1,j2)+J;
    
end
end

%Part due to V3
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
    for ll=1:M
        J=J+c(j1,ll)*c(j2,kk)*U(:,:,ll,kk);
        J=J-a(j1,ll)'*a(j2,kk)'*V3(:,:,ll,kk);
    end
    end
    
    Out(:,:,j1,j2)=Out(:,:,j1,j2)+J;
    
end
end

%%Part due to W1
%Find the Difference we want to make zero
G1=zeros(size(U));
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        if kk~=j1
        J=J-U(:,:,kk,j2)'*V2(:,:,kk,j2);
        end
        if kk~=j2
        J=J-U(:,:,j1,kk)'*V1(:,:,j1,kk);
        end
    end
    
    J=J+W1(:,:,j1,j2);
    J=J-(M+1)*U(:,:,j1,j2)'*(V1(:,:,j1,j2)+V2(:,:,j1,j2));
    
    G1(:,:,j1,j2)=G1(:,:,j1,j2)+J;
    
end
end

for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        if kk ~= j1
        J=J-V2(:,:,j1,j2)*G1(:,:,kk,j2)';
        end
        if kk~=j2
        J=J-V1(:,:,j1,j2)*G1(:,:,j1,kk)';
        end

    end
    
    J=J-(M+1)*(V1(:,:,j1,j2)+V2(:,:,j1,j2))*G1(:,:,j1,j2)';
    
    Out(:,:,j1,j2)=Out(:,:,j1,j2)+J;
    
end
end

%%Part due to W2
%Make base part
G2=zeros(size(U));
for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        if kk~=j1
        J=J+1i*cot(pi*(j1-kk)/M)*V2(:,:,kk,j2)'*U(:,:,kk,j2);
        end
        if kk~=j2
        J=J+1i*cot(pi*(j2-kk)/M)*V1(:,:,j1,kk)'*U(:,:,j1,kk);
        end
    end
    
    J=J+W2(:,:,j1,j2);
    J=J-2*V3(:,:,j1,j2)'*U(:,:,j1,j2);
    J=J+2*V2(:,:,j1,j2)'*V1(:,:,j1,j2);
    
    G2(:,:,j1,j2)=G2(:,:,j1,j2)+J;
    
end
end


for j1=1:M
for j2=1:M
    J=zeros(dim,dim);
    for kk=1:M
        if kk ~= j1
        J=J+1i*cot(pi*(kk-j1)/M)*V2(:,:,j1,j2)*G2(:,:,kk,j2);
        end
        if kk~=j2
        J=J+1i*cot(pi*(kk-j2)/M)*V1(:,:,j1,j2)*G2(:,:,j1,kk);
        end

    end
    
    J=J-2*V3(:,:,j1,j2)*G2(:,:,j1,j2);
    
    Out(:,:,j1,j2)=Out(:,:,j1,j2)+J;
    
end
end

%Find the Lipschitz constant

for j1=1:M
for j2=1:M
    H=(c(j1,j1)+c(j2,j2)+c(j1,j1)*c(j2,j2))*eye(dim,dim);
    for kk=1:M
        if kk~=j1
            H=H-cot(pi*(kk-j1)/M)^2*V2(:,:,j1,j2)*V2(:,:,j1,j2)';
        end
        if kk~=j2
            H=H-cot(pi*(kk-j2)/M)^2*V1(:,:,j1,j2)*V1(:,:,j1,j2)';
        end
    end
    H=H+(M+1)^2*(V1(:,:,j1,j2)+V2(:,:,j1,j2))*(V1(:,:,j1,j2)+V2(:,:,j1,j2))';
    H=H+(M-1)*V1(:,:,j1,j2)*V1(:,:,j1,j2)';
    H=H+(M-1)*V2(:,:,j1,j2)*V2(:,:,j1,j2)';
    H=H+4*V3(:,:,j1,j2)*V3(:,:,j1,j2)';
%This is always 5*I in our algorithm
g=norm(H,'fro')+10^-5;
Out(:,:,j1,j2)=Out(:,:,j1,j2)/g;
end
end


