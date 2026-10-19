function ccj = jthcoefficient(S,P,M,iteration)
lastindex = S(end,1)-P;                   % Takes note of the last index of f_0 w/c is the right endpoint of its support
index0 = [S(1,1)-P:1:lastindex].';        % index of the coefficients for f_0
c0k = S(:,2);                             % value at index of the coefficients for f_0
C0=[index0,c0k];
Cprev=C0;                                 % Initialize Cprev

if iteration==0
    ccj = C0(:,2);
else
    for J=1:iteration
    CJ = NextCoeff(Cprev,C0,P,J,lastindex,S); 
    Cprev = CJ;
    end
    ccj=CJ(:,2);
end

end

