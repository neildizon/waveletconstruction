function [Psi,X]=cascPsi(Phi,X,b)
%See comments from cascPhi. 
%We're working with the scaling equation
%Psi(x)=\sum_k b_k Phi(2x-k)
%So there's no way to do iterates on Psi alone, we need Phi computed first.
%Note we could compute one additional dilation on X during this process,
%but elect not to, so as to make graphing a bit simpler.
[~,M]=size(b);
Psi=zeros(size(Phi));
[~,m]=size(X);
    
for k=1:M
for ind=1:m
    %x=Xnew(ind)
    index=find(X==2*X(ind)-k+1);

    if ~isempty(index)
        Psi(ind)=Psi(ind)+b(k)*Phi(index);
    end

end
end
    
    
    
