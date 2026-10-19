function Out=WaveletTests(U,D,tol)
Out=0;

% %Test that the matrix is unitary at the main points
% N=Utest(U);
% if N<tol
%    disp(['Unitary at whole sample points (Diff=',num2str(N),')']) 
% else
%    warning(['Not Unitary at whole sample points (Diff=',num2str(N),')']) 
%    Out=1;
% end
% 
% %Test the matrix is unitary at half points
% N=Uhtest(U);
% if N<tol
%    disp(['Unitary at offset points (Diff=',num2str(N),')']) 
% else
%    warning(['Not Unitary at offset points (Diff=',num2str(N),')']) 
%    Out=1;
% end

%Test the matrix is unitary at many points
N=Umtest(U);
if N<tol
   disp(['Unitary at many points (Diff=',num2str(N),')']) 
else
   warning(['Not Unitary at many points (Diff=',num2str(N),')']) 
   Out=1;
end

%Test the first is the identity
N=I1test(U);
if N<tol
   disp(['First matrix is in 1+U(1) (Diff=',num2str(N),')']) 
else
   warning(['Incorrect first matrix (Diff=',num2str(N),')']) 
   Out=1;
end

%Test the derivatives are correct
N=Dtest(U,D);
if N<tol
   disp([num2str(D),' Derivatives of M0 are 0 (Diff=',num2str(N),')']) 
else
   warning(['Derivatives incorrect (Diff=',num2str(N),')']) 
   Out=1;
end

%Test the J,K multiples
N=Jtest(U);
if N<tol
   disp(['Satisfies J condition(Diff=',num2str(N),')']) 
else
   warning(['Does not satisfy J condition(Diff=',num2str(N),')']) 
   Out=1;
end

%Test Orthonormal shifts of phi
N=Otest(U);
if N<tol
   warning(['Does not have orthonormal shifts(Diff=',num2str(N),')']) 
   Out=1;
   
else
   disp(['Has orthonormal shifts(Diff=',num2str(N),')']) 
end


