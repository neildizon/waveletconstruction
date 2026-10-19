function W=wedge(A,B)
[~,n] = size(A);
if n==2 && isequal(size(A), size(B))
W = A(:,1).*B(:,2)-A(:,2).*B(:,1);
else
error('Dimension not valid.')
end
end