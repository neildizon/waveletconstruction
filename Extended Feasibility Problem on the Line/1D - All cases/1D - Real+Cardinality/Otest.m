function Out=Otest(U)
%Orthonormal (Cohen's Condition) Test
%Uses Fourier Transform to assume a trigonometric polynomial and samples m0
%on a unit square centered at 0. Passes if none of those points have absval
%of 0.


[~,~,M]=size(U);
%Find m0's Fourier coefficients

A=zeros(M);

for kk=1:M
    for nn=1:M
        A(kk)=A(kk)+U(1,1,nn)*exp(-2i*pi*(nn-1)*(kk-1)/M);
    end
end
A=A/M;
%disp('U has Fourier coefficients'); disp(reshape(A(1,:,:),[2,4]));

%Create samples on a unit square
%??
%How many points should we put in this? Should we make it somewhat
%variable?
%??

N=100*M;

%Create the X,Y points of the once contracted unit square centered at the
%origin
X=-1/4:1/(2*N):1/4;
%[X,Y]=meshgrid(-1/4:1/(2*N):1/4);



%Find the value of m0 at these new grid points.
m0=zeros(1,N+1);
        for kk=1:M
            m0=m0+A(kk)*exp(2i*pi*((kk-1)*X));
        end
        
m0=abs(m0);

T=min(min(m0));

Out=T;