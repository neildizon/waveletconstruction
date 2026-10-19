function XA = chimodulate(A,ll)
%%% Modulates A by a modulation factor of exp(2*pi*wedge(ll,k)/M
    
    % Input
          % A is the ensemble of coefficients
          % ll is a 1-by-2 vector
    % Output
          % XA is a modulated ensemble of coefficients

[dim,~,M,~] = size(A);
XA = zerosq(dim,dim,M,M);

for xx=1:M
    for yy=1:M
        XA(:,:,xx,yy) = kernel([ll(1), ll(2)],[xx-1, yy-1],M)*A(:,:,xx,yy);
    end
end

