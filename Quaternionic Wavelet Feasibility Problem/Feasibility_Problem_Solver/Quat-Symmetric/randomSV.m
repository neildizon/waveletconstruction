function A=randomSV(n)
% creates a n-by-n quaternionic matrix of block SV matrices
% where n is even
if mod(n,2)==1
    error('input parameter must be even');
else
S=toeplitz(mod(1:n,2));
V=fliplr(S);
rng('shuffle');
As=rand(n).*S;
rng('shuffle');
Ax=rand(n).*V;
rng('shuffle');
Ay=rand(n).*V;
rng('shuffle');
Az=rand(n).*S;
A=quaternion(As,Ax,Ay,Az);
end
end