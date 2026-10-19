function Out=PUtest(U)
%Tests certain theorems in the 2D ParaUnitarity theory
[dim,~,M,~]=size(U);


%Use this to create all Fourier coefficients needed throughout script
[a,~,~,~]=constantmaker(M,1);
%set up V and W to be correct given U was right
[V1,V2,V3,~,~]=initVW(U,a);

N=0;
for j1=1:M
for j2=1:M
J=zeros(dim,dim);
    for kk=1:M
        if kk~=j1
        J=J-a(kk,j1)*(U(:,:,kk,j2)'*V2(:,:,kk,j2)-V2(:,:,kk,j2)'*U(:,:,kk,j2));
        end
        if kk~=j2
        J=J-a(kk,j2)*(U(:,:,j1,kk)'*V1(:,:,j1,kk)-V1(:,:,j1,kk)'*U(:,:,j1,kk));
        end
    end
   J=J+(M+1)*U(:,:,j1,j2)'*(V1(:,:,j1,j2)+V2(:,:,j1,j2))/2;
   J=J-(M+1)*(V1(:,:,j1,j2)+V2(:,:,j1,j2))'*U(:,:,j1,j2)/2;
    %THEOREM 3.3 is just fine
   J=J+U (:,:,j1,j2)'*V3(:,:,j1,j2)+V3(:,:,j1,j2)'*U (:,:,j1,j2);
    
   J=J-V2(:,:,j1,j2)'*V1(:,:,j1,j2)-V1(:,:,j1,j2)'*V2(:,:,j1,j2);
    
N=N+norm(J,'fro');
end
end

Out=N;




