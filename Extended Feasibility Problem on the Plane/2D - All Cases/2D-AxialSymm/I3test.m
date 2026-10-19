function Out=I3test(U)
%1 star U(3) Test.
%Check if the first matrix has the unit vector (1,0,0,0) in top row and
%first column and has a unitary submatrix


[dim,~,M,~]=size(U);
U0=U(:,:,1,1);
UI=U0;
UI(2:4,2:4)=eye(dim-1);
U3=U0(2:4,2:4);
N=norm(UI-eye(dim),'fro')^2+norm(U3'*U3-eye(dim-1),'fro')^2;
Out=sqrt(N);


% if N<tol
%    disp(['First matrix is the identity (Diff=',num2str(N),')']) 
%    Out=0;
% else
%    warning(['Non Identity in first matrix (Diff=',num2str(N),')']) 
%    Out=1;
% end

