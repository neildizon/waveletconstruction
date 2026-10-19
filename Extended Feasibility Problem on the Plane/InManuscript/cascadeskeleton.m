function [Phi,X1,X2]=cascadeskeleton(a)
%a is the mask at the integers 0,1,...M-1

%Phi is the value of phi at the x values
%X is the list of points where those values are taken

[~,M]=size(a);

B=zeros(M^2,M^2);
for x1=1:M
for x2=1:M
for k1=1:M
for k2=1:M
    X1=2*x1-k1;
    X2=2*x2-k2;
    if X1>0 && X1<M+1 && X2>0 && X2<M+1
        B(nu(x1,x2,M),nu(X1,X2,M))=a(k1,k2);
    end
end
end
end
end



%Find eigenvectors and values using MATLAB!
[V,D]=eig(B);
%Select the eigenvalue 1/2
[~,y]=find(real(D)>.249,1, 'last');
%Select the eigenvector corresponding to 1/2
Phi=reshape(V(:,y),[M,M]);
%Create the X values where the samples are happening.
[X1,X2]=meshgrid(0:M-1);

