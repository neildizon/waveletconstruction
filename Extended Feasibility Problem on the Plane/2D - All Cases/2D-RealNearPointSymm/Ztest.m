function Out=Ztest(U)
%Test U matrix for connected zero sets in the x and y directions. 
%Since we have a trigonometric polynomial, there will always be a connected
%zero set, but this ensures there is no full row or column of zeros.

%It's not actually clear that this is useful, but it might serve as a sort
%of "very non-separable test".


[dim,~,M,~]=size(U);




t=2*M;
for dd=1:dim
    for ss=1:M
        a=norm(reshape(U(1,dd,ss,:),1,M));
        b=norm(reshape(U(1,dd,:,ss),1,M));
        t=min([t,a,b]);
    end
end

Out=t;

% if t<tol
%    warning(['U is Separable(Diff=',num2str(t),')']) 
%    Out=1;
% else
%    disp(['U Sequence is non-Separable(Diff=',num2str(t),')']) 
%    Out=0;
% end
end


