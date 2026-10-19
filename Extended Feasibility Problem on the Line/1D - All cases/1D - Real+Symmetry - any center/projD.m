function U=projD(U,D)

[dim,~,N]=size(U);




% A=zeros(D+1,N);
% %Force m0's derivatives to be 0 at 1/2
% for J=1:D+1;
%     for L=1:N;
%         for K=1:N;
%             A(J,L)=A(J,L)+exp(pi*2i*(K-1)*(1/2-(L-1)/N))*(K-1)^(J-1);
%         end
%     end
% end
% 
% if rank(A)>= N;
%     error('A has no kernel')
% end
% %work out the projection matrix
% Pnull(:,:,1)=eye(N)-A'/(A*A')*A;

% %work out the orthogonal projection matrix via svd
% [~,S,W]=svd(A);
% S=isinf(S/0);
% S(N,N)=0;
% Pnull(:,:,1)=W*(eye(N)-S)*W';

B=zeros(D+1,N);
%Force derivatives to be 0 at 0
for J=1:D+1;
    for L=1:N;
        for K=1:N;
            B(J,L)=B(J,L)+exp(-pi*2i*(K-1)*(L-1)/N)*(K-1)^(J-1);
        end
    end
end

if rank(B)>= N;
    error('B has no kernel')
end

Pnull=eye(N)-B'/(B*B')*B;


% %work out the projection matrix by svd
% [~,S,W]=svd(B);
% S=isinf(S/0);
% S(N,N)=0;
% Pnull(:,:,2)=W*(eye(N)-S)*W'

U(1,2,:)=Pnull*reshape(U(1,2,:),[N,1]);
U(2,2,:)=circshift(U(1,2,:),[0,0,N/2]);
U(2,1,:)=Pnull*reshape(U(2,1,:),[N,1]);
U(1,1,:)=circshift(U(2,1,:),[0,0,N/2]);

% %Find m_0 and m_1 samples
% M=UtoM(U);
% for tt=1:dim
%     M(:,tt)=Pnull(:,:,tt)* M(:,tt);
%     %Plug M straight back into U
%     %U(1,tt,:)=M(:,tt);
% end
% %If you plugged straight back
% %Out=U;
% %Also enforces the J condition
% Out=MtoU(M);


