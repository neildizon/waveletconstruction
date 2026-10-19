function [Out,N]=SepTest(U,tol)
%Separability Test
%Test if M0,M1,M2 and M3 are separable in the dumbest way possible.


[~,~,M,~]=size(U);
t=M/2+1; %The index at which 1/2 happens

%check at 0 whether M0 is a tensor.
M0=zeros(M,M);M1=zeros(M,M);M2=zeros(M,M);M3=zeros(M,M);
min(abs([U(1,1,1,1),U(1,2,t,1),U(1,3,1,t),U(1,4,t,t)]));
for xx=1:M
for yy=1:M
    M0(xx,yy)=norm(U(1,1,xx,yy)-U(1,1,1,yy)*U(1,1,xx,1)/U(1,1,1,1),'fro');
    M1(xx,yy)=norm(U(1,2,xx,yy)-U(1,2,t,yy)*U(1,2,xx,1)/U(1,2,t,1),'fro');
    M2(xx,yy)=norm(U(1,3,xx,yy)-U(1,3,1,yy)*U(1,3,xx,t)/U(1,3,1,t),'fro');
    M3(xx,yy)=norm(U(1,4,xx,yy)-U(1,4,t,yy)*U(1,4,xx,t)/U(1,4,t,t),'fro');
end
end
M0;
M1;
M2;
M3;
N=norm(M0,1)+norm(M1,1)+norm(M2,1)+norm(M3,1);
    
if N<tol
   warning(['Separable (Diff=',num2str(N),')']) 
   Out=1;
   
else
    disp(['Non-separable (Diff=',num2str(N),')']) 
    Out=0;
end





end


