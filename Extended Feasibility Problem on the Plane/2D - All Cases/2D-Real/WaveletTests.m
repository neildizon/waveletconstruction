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

%Test that the matrix is unitary at the many points
N=Umtest(U);
if N<tol
   disp(['Unitary at many sample points (Diff=',num2str(N),')']) 
else
   warning(['Not Unitary at many sample points (Diff=',num2str(N),')']) 
   Out=1;
end


%Test the first is the identity
N=I3test(U);
if N<tol
   disp(['First matrix is the identity (Diff=',num2str(N),')']) 
else
    N=I3test(U);
    if N<tol
    disp(['First matrix is in 1@U(3) (Diff=',num2str(N),')']) 
    else
    warning(['First matrix not in 1@U(3) (Diff=',num2str(N),')']) 
    Out=1;
    end
end

%Test the derivatives are correct
N=Dtest(U,D);
if N<tol
   disp([num2str(D),' Derivatives of M0(p,q,p+q), M1(0), M2(0), M3(0) are 0 (Diff=',num2str(N),')']) 
else
   warning(['Derivatives incorrect (Diff=',num2str(N),')']) 
   Out=1;
end


%Test the J,K multiples
N=Jtest(U);
if N<tol
   disp(['Satisfies J, K condition(Diff=',num2str(N),')']) 
else
   warning(['Does not satisfy J, K condition(Diff=',num2str(N),')']) 
   Out=1;
end

%Test if the matrix is separable
N=Stest(U);
if N<tol
   warning(['U is Separable(Diff=',num2str(N),')']) 
   Out=1;
else
   disp(['U Sequence is not a tensor(Diff=',num2str(N),')']) 
end


%Test if the matrix has connected zero sets
N=Ztest(U);
if N<tol
   disp(['U has connected zeros(Diff=',num2str(N),')']) 
else
   disp(['U has isolated zeros(Diff=',num2str(N),')']) 
end


%Test if Bownik's Cohen's condition for orthonormal wavelets is met
N=Otest(U);
if N<tol
   warning(['Wavelets not orthonormal(Diff=',num2str(N),')']) 
   Out=1;
else
   disp(['Wavelets orthonormal(Diff=',num2str(N),')']) 
end




