function Out=Jtest(U)
%J/K Consistency Test
%Test if rotating samples rowshifts the matrix.


[dim,~,M,~]=size(U);

I=eye(dim);
J=I([2,1,4,3],:);
K=I([3,4,1,2],:);

A=U-mJ(J,U);
B=U-mK(K,U);

t=0;
for tt=1:M
    for ss=1:M
    t=max([t,norm(A(:,:,tt,ss)),norm(B(:,:,tt,ss))]);
    end
end

Out=t;





% 
% if t<tol
%    disp(['Satisfies J, K condition(Diff=',num2str(t),')']) 
%    Out=0;
% else
%    warning(['Does not satisfy J, K condition(Diff=',num2str(t),')']) 
%    Out=1;
% end
end

function U=mJ(J,U)

[~,~,N,~]=size(U);

for jj=1:N
    for ll=1:N
        U(:,:,jj,ll)=J*U(:,:,jj,ll);
    end
end
U=circshift(U,[0 0 N/2 0]);

end


function U=mK(K,U)

[~,~,N,~]=size(U);

for jj=1:N
    for ll=1:N
        U(:,:,jj,ll)=K*U(:,:,jj,ll);
    end
end
U=circshift(U,[0 0 0 N/2]);

end

