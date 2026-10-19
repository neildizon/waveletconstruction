function hess = quadhess(x,lambda,Q,H,J)
hess = Q;
jj = length(H); % jj is the number of inequality constraints
kk = length(J);
for i = 1:jj
 hess = hess + lambda.ineqnonlin(i)*H{i};
end
for i=1:kk
 hess=hess + lambda.eqnonlin(i)*J{i};
end