function Unew=symm(U,EPS)
[~,~,M]=size(U);
Unew=U;
U11=U(1,1,:);
U11=U11(:).';
U11=symmdiag(U11,M,EPS);
Unew(1,1,:)=U11;

%U22=U(2,2,:);
%U22=U22(:).';
%U22=symmdiag(U22,M,EPS);
%Unew(2,2,:)=U22;


%U12=U(1,2,:);
%U12=U12(:).';
%U12=symmoff(U12,M,EPS);
%Unew(1,2,:)=U12;

%U21=U(2,1,:);
%U21=U21(:).';
%U21=symmoff(U21,M,EPS);
%Unew(2,1,:)=U21;

Unew(2,1,:)=circshift(U11,[0,M/2]);
%Unew(2,1,:)=circshift(U11,M/2);
end
