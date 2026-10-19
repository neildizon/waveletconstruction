function Out=PUtest2(U)
%Tests certain theorems in the 2D ParaUnitarity theory

[dim,~,M,~]=size(U);


%Use this to create all Fourier coefficients needed throughout script
[b]=bmaker(M);
%set up V and W to be correct given U was right


N=0;
for r1=1:M
for r2=1:M
J=zeros(dim,dim);
    for m1=1:M
    for m2=1:M
        for n1=1:M
        for n2=1:M
            J=J+U(:,:,n1,n2)'*U(:,:,m1,m2)*b(m1,n1,r1)*b(m2,n2,r2);
            
        end
        end
    end
    end
    if r1==1 && r2==1
       J=J-M^4*eye(dim,dim);
       
    
    end
    
N=N+norm(J,'fro'); 
end
end

Out=N;




