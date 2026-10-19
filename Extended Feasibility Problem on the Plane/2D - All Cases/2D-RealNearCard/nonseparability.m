function S = nonseparability(H)
[N,~]=size(H);
I = ones(N,1);
S = norm((H*I)*((H.')*I).' - H, 'fro');
end
