function cascadeplotsNeil(U,c,name,col,opt)
if opt==0
    opt=[0,0];
end
%Convert a U sequence back to a scaling mask A (and B for the wavelet)

[A,B1,B2,B3]=U2A(U);
%Create integer points
[Psi0,X1,X2]=cascadeskeleton(A);
%Cascade c times
[Psi0,X1,X2]=cascPhi(Psi0,X1,X2,A,c);
%Create the 3 wavelets
%[Psi1,X1,X2]=cascPsi(Psi0,X1,X2,B1);
%[Psi2,X1,X2]=cascPsi(Psi0,X1,X2,B2);
%[Psi3,X1,X2]=cascPsi(Psi0,X1,X2,B3);

%Z=X1+1i*X2;


%[Psi0,X1,X2]=cascPhi(Phi,X1,X2,a,5);
PHASE=angle(Psi0);
RR=abs(Psi0);

%PHASE=rescale(PHASE,0,1);
fig=figure;
%subplot(1,4,1);
surf(X1,X2,RR,PHASE,'FaceColor','interp','EdgeAlpha',0.15);
view(-45,45)
axis square tight on; set(gca,'box','off');
xl=xlabel('x_1');  yl=ylabel('x_2'); 
title('\phi','fontsize',12);