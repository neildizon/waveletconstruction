function Unew=symm(U,EPS,P)
[~,~,M]=size(U);
Unew=U;
U11=U(1,1,:);
U11=U11(:).';
U11=symmdiag11(U11,M,EPS,P);
Unew(1,1,:)=U11;

U22=U(2,2,:);
U22=U22(:).';
U22=symmdiag22(U22,M,EPS,P);
Unew(2,2,:)=U22;


U12=U(1,2,:);
U12=U12(:).';
U12=symmoff12(U12,M,EPS,P);
Unew(1,2,:)=U12;
 
U21=U(2,1,:);
U21=U21(:).';
U21=symmoff21(U21,M,EPS,P);
Unew(2,1,:)=U21;

%Unew(2,1,:)=circshift(U11,[0,M/2]);
%Unew(2,1,:)=circshift(U11,M/2);
end
