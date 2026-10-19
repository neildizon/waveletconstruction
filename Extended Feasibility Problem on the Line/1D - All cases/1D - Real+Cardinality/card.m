function Unew=card(U,EPS,J)
[~,~,M]=size(U);
Unew=U;
U11=U(1,1,:);
U11=U11(:).';
U11=card11(U11,M,EPS,J);
Unew(1,1,:)=U11;


%Unew(2,1,:)=circshift(U11,M/2);
Unew(2,1,:)=circshift(U11,[0,M/2]);
end
