function [output]=isSVblock(A)
%checks if a quaternion matrix is a matrix of block SV matrices
[m,~]=size(A);
S=toeplitz(mod(1:m,2));
V=fliplr(S);
value = norm(s(A)-S.*s(A)) + norm(x(A)-V.*x(A)) + norm(y(A)-V.*y(A)) + norm(z(A)-S.*z(A));
if value < 10e-10
    output = true;
else
    output = false;
end




