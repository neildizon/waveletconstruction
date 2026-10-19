function [Phi,X]=cascadeskeleton(a)
%A is the mask at the integers 0,1,...M-1

%Phi is the value of phi at the x values
%X is the list of points where those values are taken

%Phi can be determined on the points 0,1,...M-1 by using the scaling
%equation Phi(x)=\sum_k a(k) Phi(2x-k).
%
%For the points 0,1,...M-1, this can be converted into a classic eigenvalue
%problem Phi=B*Phi for some matrix  based on a. I say based on a because
%the dilation and shifting has to be accounted for. 


%It's not really intuitive why the below code works, but it makes the
%matrix B based on the mask a

%Find the size of the mask a
[~,M]=size(a);
%Set up an oversized empty matrix
B=zeros(M,3*M-2);

A=[flip(a),zeros(1,2*M-2)];
%Fill in B based on shifts of a
for j=1:M
    B(j,:)=A;
    A=circshift(A,[0,2]);
end
%Select out the middle of B
B=B(:,M:2*M-1);

%This is a truly 1D set of tricks to make B, we're going to have to be less
%smart in 2D.

%Now we just solve the eigenvalue problem to find Phi

%Find eigenvectors and values using MATLAB!
[V,D]=eig(B);
%Select the eigenvalue 1
[~,y]=find(real(D)>.99 & real(D)<1.01);
if isempty(y)
    y=1;
    warning('cascade found no eigenvalue 1')
end

%Select the eigenvector corresponding to 1
Phi=V(:,y).'/sum(V(:,y));
%Create the X values where the samples are happening.
X=0:M-1;

