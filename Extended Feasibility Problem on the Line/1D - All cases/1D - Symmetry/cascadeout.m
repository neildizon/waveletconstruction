function [X,Phi,Psi]=cascadeout(U,n)

%Convert a U sequence back to a scaling mask A (and B for the wavelet)
[A,B]=U2A(U);
%Solve the eigenvalue problem to find Phi at integer points
[Phi,X]=cascadeskeleton(A);
%Then iterate the cascade 7 times
[Phi,X]=cascPhi(Phi,X,A,n);
%Then create the wavelet based on Phi and the mask B
[Psi,X]=cascPsi(Phi,X,B);

% %Create plots of scaling function and wavelet
% figure(3)
% subplot(1,2,1)
% plot(X,real(Phi));title('Phi-The Scaling Function')
% subplot(1,2,2)
% plot(X,real(Psi));title('Psi-The Wavelet')