function [A,B1,B2,B3]=U2A(U)

[~,~,M,~]=size(U);

    %Create Fourier Coefficients A_k
    A=zeros(M,M);
    B1=zeros(M,M);
    B2=zeros(M,M);
    B3=zeros(M,M);
for kk=1:M
for jj=1:M
    for ll=1:M
    for nn=1:M
        A(jj,kk)=A(jj,kk)+U(1,1,ll,nn)*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
        B1(jj,kk)=B1(jj,kk)+U(1,2,ll,nn)*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
        B2(jj,kk)=B2(jj,kk)+U(1,3,ll,nn)*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
        B3(jj,kk)=B3(jj,kk)+U(1,4,ll,nn)*exp(-2i*pi*((kk-1)*(ll-1)+(jj-1)*(nn-1))/M);
        
    end
    end
end
end
    A=A/M^2;    
    B1=B1/M^2;
    B2=B2/M^2;
    B3=B3/M^2;
    




