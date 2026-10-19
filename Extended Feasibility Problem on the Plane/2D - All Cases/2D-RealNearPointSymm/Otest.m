function Out=Otest(U)
%Orthonormal (Cohen's Condition) Test
%Uses Fourier Transform to assume a trigonometric polynomial and samples m0
%on a unit square centered at 0. Passes if none of those points have absval
%of 0.


[~,~,M,~]=size(U);
%Find m0's Fourier coefficients
A=zeros(M,M);
        for kk=1:M
        for jj=1:M
        for ll=1:M
        for nn=1:M
            A(jj,kk)=A(jj,kk)+U(1,1,ll,nn)*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
        end
        end
        end
        end
    A=A/M^2;
%disp('U has Fourier coefficients'); disp(reshape(A(1,:,:),[2,4]));

%Create samples on a unit square
%??
%How many points should we put in this? Should we make it somewhat
%variable?
%??

N=100*M;

%Create the X,Y points of the once contracted unit square centered at the
%origin
[X,Y]=meshgrid(-1/4:1/(2*N):1/4);



%Find the value of m0 at these new grid points.
m0=zeros(N+1,N+1);
        for jj=1:M
        for kk=1:M
            m0=m0+A(jj,kk)*exp(2i*pi*((kk-1)*Y+(jj-1)*X));
        end
        end
        
m0=abs(m0);

T=min(min(m0));

Out=T;


% 
% if N<tol
%    disp(['Unitary at offset points (Diff=',num2str(N),')']) 
%    Out=0;
% else
%    warning(['Not Unitary at offset points (Diff=',num2str(N),')']) 
%    Out=1;
% end