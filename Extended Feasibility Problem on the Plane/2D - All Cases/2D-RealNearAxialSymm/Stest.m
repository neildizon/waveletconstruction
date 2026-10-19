function Out=Stest(U)
%Separability Test
%Test if interior samples are tensor products of the edge samples
%Out will be small if U is separable, large for nonseparable
tol=10^-5;

[~,~,M,~]=size(U);

U0=U(:,:,1,1).';
Ulist=U0(abs(U0)>tol);
z=Ulist(2);
y=Ulist(3);

%Step 1: Does it have more than 4 numbers?
test=length(Ulist)-4;
if test==0
    %Step 2: Is it 1,z,z,z^2
    %Ulist-[1,z,z,z^2]'
    test=norm(Ulist-[1,z,y,z*y].');

    if test<tol
        %Step 3: Check if U(y1,0)*U(0,y2)=Z1*U(y1,y2)*Z2 for each sample
        %disp('sep?')
        [row,~]=find(abs(U(:,:,1,1))>10^-5);
        indices=[find(row==1),find(row==2),find(row==3),find(row==4)];
        U=U(:,indices,:,:);

        Z1=[1,0,0,0;0,1,0,0;0,0,y,0;0,0,0,y];
        Z2=[1,0,0,0;0,z,0,0;0,0,1,0;0,0,0,z];

        B=zeros(M,M);
        for tt=1:M
        for ss=1:M
        B(tt,ss)=norm(Z1*U(:,:,tt,ss)*Z2-U(:,:,tt,1)*U(:,:,1,ss));

        Out=max(max(B));
        end
        end
    else
    Out=Inf;
    
    disp('U(0) has entries not 1,z,z,z^2')
    end
else
Out=Inf;

disp('U(0) has more than 4 entries')
end







end


