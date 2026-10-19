function [A,B]=U2A(U)

[~,~,M]=size(U);

    %Create Fourier Coefficients A_k
    A=zeros(1,M);
    B=zeros(1,M);
for jj=1:M
    for ll=1:M
        A(jj)=A(jj)+U(1,1,ll)*exp(-2i*pi*((ll-1)*(jj-1))/M);
        B(jj)=B(jj)+U(1,2,ll)*exp(-2i*pi*((ll-1)*(jj-1))/M);
    end
end
    A=2*A/(M);    
    B=2*B/(M);    
    
    




