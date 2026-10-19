function E = kernel(xi,kk,M)
e = exp(2*pi*qk*wedge(xi,kk)/M);
ee = [e 0; 0 conj(e)];
E = blkdiag(ee,ee,ee,ee);
end

