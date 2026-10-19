function N=I1test(U)
%Check if U(0) has the form [1,0;0,z], and |z|=1

I=eye(2);
I(2,2)=U(2,2,1)/abs(U(2,2,1));
N=norm(U(:,:,1)-I);


