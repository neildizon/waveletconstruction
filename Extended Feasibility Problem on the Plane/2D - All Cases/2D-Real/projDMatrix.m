function [P0,P1]=projDMatrix(M,D)


%Create the B matrices required to force vectors of 
%m_0 to have derivatives be 0 at p, q and p+q
%m_n to have derivatives be 0 at 0
B=zeros(1,M^2);
%Make the rows that force derivatives to be zero
for xi=1:3
    switch xi
        case 1
            %p=(1/2,0)
            xx=-1;yy=1;
        case 2
            %q=(0,1/2)
            xx=1; yy=-1;
        case 3
            %p+q=(1/2,1/2)
            xx=-1;yy=-1;
    end

%     %OLD VERSION, ONLY x and y derivatives.
% for dd=1:D
%     Dx=zeros(N,N);Dy=zeros(N,N);
% for ll=1:N
%     for nn=1:N
%         for jj=0:N-1
%             for kk=0:N-1
%         %x derivative
%         Dx(nn,ll)=Dx(nn,ll)+sum(exp(-pi*2i* (jj*(ll-1)+kk*(nn-1))/N) *xx^jj *yy^kk *jj^dd);
%         %y derivative
%         Dy(nn,ll)=Dy(nn,ll)+sum(exp(-pi*2i* (jj*(ll-1)+kk*(nn-1))/N) *xx^jj *yy^kk *kk^dd);
%             end
%         end
%     end
% end
% %This gives us matrices that kill the 0th, 1xth and 1yth derivatives at 0
% %We apply them to the Gram Schmidt queue.
% B=extend(B,Dx);B=extend(B,Dy);
% end

%NEW VERSION Does split derivatives
for dd=1:D
    for d=0:dd
    Dxi=zeros(M,M);
for ll=1:M
    for nn=1:M
        for jj=0:M-1
            for kk=0:M-1
        Dxi(nn,ll)=Dxi(nn,ll)+sum(exp(-pi*2i* (jj*(ll-1)+kk*(nn-1))/M) *xx^jj *yy^kk *jj^(dd-d) *kk^d);
            end
        end
    end
end
%This gives us matrices that kill the mixed derivatives at xi=p
%We apply them to the Gram Schmidt queue.
B=extend(B,Dxi);
    end
end

%Repeat for xi=q,p+q.
end

%Now we make the projection matrices
%Will make derivatives zero at p, q and p+q.
M0=B(2:end,:);
size(M0);
%Projection onto nullspace is I-M'/(M*M')*M
P0=eye(M^2)-M0'/(M0*M0')*M0;




%Now we restart the algorithm to make the m_1 version
B=zeros(1,M^2);
%Make the rows that force derivatives to be zero


%O=(0,0)
xx=1; yy=1;

%     %OLD VERSION, ONLY x and y derivatives.
% for dd=1:D
%     Dx=zeros(N,N);Dy=zeros(N,N);
% for ll=1:N
%     for nn=1:N
%         for jj=0:N-1
%             for kk=0:N-1
%         %x derivative
%         Dx(nn,ll)=Dx(nn,ll)+sum(exp(-pi*2i* (jj*(ll-1)+kk*(nn-1))/N) *xx^jj *yy^kk *jj^dd);
%         %y derivative
%         Dy(nn,ll)=Dy(nn,ll)+sum(exp(-pi*2i* (jj*(ll-1)+kk*(nn-1))/N) *xx^jj *yy^kk *kk^dd);
%             end
%         end
%     end
% end
% %This gives us matrices that kill the 0th, 1xth and 1yth derivatives at 0
% %We apply them to the Gram Schmidt queue.
% B=extend(B,Dx);B=extend(B,Dy);
% end

%NEW VERSION Does split derivatives
for dd=1:D
    for d=0:dd
    Dxi=zeros(M,M);
for ll=1:M
    for nn=1:M
        for jj=0:M-1
            for kk=0:M-1
        Dxi(nn,ll)=Dxi(nn,ll)+sum(exp(-pi*2i* (jj*(ll-1)+kk*(nn-1))/M) *xx^jj *yy^kk *jj^(dd-d) *kk^d);
            end
        end
    end
end
%This gives us matrices that kill the 0th, 1xth and 1yth derivatives at 0
%We apply them to the Gram Schmidt queue.
B=extend(B,Dxi);
    end
end








%Now we make the projection matrices
%Will make derivatives zero at 0 only
%M1=B(2:2*D+1,:);
M1=B(2:(D+1)*(D+2)/2,:);
size(M1); %corrected based on matt and davids emails


%Projection onto nullspace is I-M'/(M*M')*M
P1=eye(M^2)-M1'/(M1*M1')*M1;


end

function B=extend(B,C)
C=reshape(C.',[1,numel(C)]);
B=cat(1,B,C);

end