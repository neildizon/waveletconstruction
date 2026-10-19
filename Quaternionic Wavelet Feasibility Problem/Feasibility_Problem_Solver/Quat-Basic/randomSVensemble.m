function A=randomSVensemble(n)
% creates a 8-by-8-by-n-by-n quaternionic matrix of block SV matrices
% where n is even
if mod(n,2)==1,
    error('input parameter must be even');
else
A=zerosq(8,8,n,n);
for jj=1:n
    for kk=1:n
        A(:,:,jj,kk)=randomSV(8);
    end
end
end
end

