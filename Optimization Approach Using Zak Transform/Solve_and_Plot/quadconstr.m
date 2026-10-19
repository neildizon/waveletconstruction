function [y,yeq,grady,gradyeq] = quadconstr(x,H,k,d,J,p,q)
jj = length(H); % jj is the number of inequality constraints
kk = length(J);
y = zeros(1,jj);
for i = 1:jj
 y(i) = 1/2*x'*H{i}*x + k{i}'*x + d{i};
end
yeq = zeros(1,kk);
for i = 1:kk
 yeq(i) = 1/2*x'*J{i}*x + p{i}'*x + q{i};
end

if nargout > 2
 grady = zeros(length(x),jj);
 for i = 1:jj
 grady(:,i) = H{i}*x + k{i};
 end
end
if nargout > 2
 gradyeq = zeros(length(x),kk);
 for i = 1:kk
 gradyeq(:,i) = J{i}*x + p{i};
 end
end