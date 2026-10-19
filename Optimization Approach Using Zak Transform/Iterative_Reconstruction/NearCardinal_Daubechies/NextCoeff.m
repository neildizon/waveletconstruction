function CJ = NextCoeff(Cprev,C0,P,J,lastindex,S)
indexprev = Cprev(:,1);

indexJ = [S(1,1)- P:1:lastindex].';
%indexJ = [S(1,1)-(J+1)*P:1:lastindex].';
cJk = zeros(size(indexJ));
for k=1:length(indexJ)
    subtract = 0;
    for l=indexprev(1):indexprev(length(indexprev))
        subtract = subtract + CC(Cprev,l)*phi(indexJ(k)+P-l);
    end
    cJk(k)= CC(Cprev,indexJ(k)) + CC(C0,indexJ(k)) - subtract;
end
CJ=[indexJ,cJk];
