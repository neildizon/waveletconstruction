function E = kernel2(xi,kk,M)
e = exp(2*pi*qk*wedge(xi,kk)/M);
E = [e 0; 0 conj(e)];
end

