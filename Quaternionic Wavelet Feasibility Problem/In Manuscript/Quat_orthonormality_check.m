function [E1,E2] = Quat_orthonormality_check(filename)
load(filename,'PDR');
Useq=PDR;
A = myIDFT2(Useq);
[~,~,M,~]=size(Useq);
c=15;

N=c*M;
[X,Y]=meshgrid(-1/4:1/(2*N):1/4);
M0=zerosq(N+1,N+1);
M1=zerosq(N+1,N+1);
for jj=1:M
for kk=1:M
    M0=M0 + exp(2*pi*qk*(X*(kk-1)-Y*(jj-1)))*(A(1,1,jj,kk)+A(1,2,jj,kk));
    M1=M1 + exp(-2*pi*qk*(X*(kk-1)-Y*(jj-1)))*(A(1,1,jj,kk)+A(1,2,jj,kk));
end
end

S1 = abs(s(M0) + z(M0)*qk).^2 + abs(x(M1)*qi + y(M1)*qj).^2;
S2 = abs(s(M1) + z(M1)*qk).^2 + abs(x(M0)*qi + y(M0)*qj).^2;
V1 = conj(s(M0) + z(M0)*qk).*(x(M0)*qi + y(M0)*qj) + conj(x(M1)*qi + y(M1)*qj).*(s(M1) + z(M1)*qk);
V2 = conj(x(M0)*qi + y(M0)*qj).*(s(M0) + z(M0)*qk) + conj(s(M1) + z(M1)*qk).*(x(M1)*qi + y(M1)*qj); 
E1 = (S1 + S2 + sqrt((S1-S2).^2 + 4*V1.*V2))/2;
E2 = (S1 + S2 - sqrt((S1-S2).^2 + 4*V1.*V2))/2;


fig=figure;
Z=min(s(E1),s(E2));
surf(X,Y,Z,'FaceAlpha',0.9,'EdgeColor','interp');
axis square tight on; set(gca,'box','off');
view([45,15])
xl=xlabel('$\xi_1$','Interpreter','latex');  yl=ylabel('$\xi_2$','Interpreter','latex'); 
y1=zlabel('$\Lambda(\xi)$','Interpreter','latex'); 
zlim([0 max(max(Z))]);
Name=strcat('Orthonormality_',filename);
print('-dpng', strcat('pics_orthonormality\',Name));
%savefig(fig,Name);

%norm(s(E1)-s(E2))
%display('Hey')
  
if min(min(Z))>10e-9
    disp('The scaling function and wavelets have orthogonal shifts.');
else
    disp('Oops! The scaling function and wavelets do not have orthogonal shifts.');
end
end
