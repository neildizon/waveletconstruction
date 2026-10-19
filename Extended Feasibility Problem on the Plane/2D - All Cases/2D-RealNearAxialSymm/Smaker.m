function Out=Smaker(U)
%Separability Test
%Test if interior samples are tensor products of the edge samples


[~,~,M,~]=size(U);

B=zeros(size(U));


for tt=1:M
    for ss=1:M
    B(:,:,tt,ss)=U(:,:,tt,ss)-U(:,:,1,ss)*U(:,:,tt,1);
    end
end
% disp('Separabile Matrix based on U is:')
% disp(B)
Out=B;

% if t<tol
%    warning(['U is Separable(Diff=',num2str(t),')']) 
%    Out=1;
% else
%    disp(['U Sequence is non-Separable(Diff=',num2str(t),')']) 
%    Out=0;
% end
end


