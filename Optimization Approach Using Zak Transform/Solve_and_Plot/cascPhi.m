function [Phi,X]=cascPhi(Phi,X,a,n)
%Franklin's code at http://hdl.handle.net/1959.13/1395061

%Find the size of the mask and original grid
[~,M]=size(a);
step=X(2)-X(1);

for l=1:n
    %Create the additional points that are half steps away from the grid
    Xnew=X(2:end)-step/2^l;
    
    %Work out hom many such points there are, and preallocates new Phi
    [~,m]=size(Xnew);
    Phinew=zeros(1,m);
    
    for k=1:M
    for ind=1:m
        %For each point in Xnew, find the dilated and shifted point x
        %x=Xnew(ind)
        %Then find the index in the old X values
        index=find(X==2*Xnew(ind)-k+1);
        % If it's there, add to the sum based on the scaling equation
        if ~isempty(index)
            Phinew(ind)=Phinew(ind)+2*a(k)*Phi(index);
        end
    
    end
   
    end
    
    
    
    %Add these new X and Phi values to the old ones.
    X=[X,Xnew];
    Phi=[Phi,Phinew];
    %disp('One cascade iteration concluded')    
end

%sort the list of X and Phi values.
S=[X.',Phi.'];
S=sortrows(S);
X=S(:,1).';
Phi=S(:,2).';
