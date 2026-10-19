function Umat=NeilSamples(N,D)
%Take N samples from the Daubechies' wavelets that have D derivatives 0.
switch D
    case 1
        %"standard" Daubechies
        mu=1+sqrt(3);
        F=[mu/4,(2+mu)/4,(4-mu)/4,(2-mu)/4]/2;
        %h=flip(h);
        %h=sqrt(2)*[.4829629131445341,.8365163037378077,.2241438680420134,-.1294095225512603];
        %g=[(1-mu)/4,(mu-2)/4,(1+mu)/4,-mu/4];
    case 2
        F = [-0.145624553424944, 0.384642956250171, 1.194332870460568, 0.633797851577742, -0.048708316899379, -0.018440807590790];                                     ...
                
    case 3
         F = [...
   0.16290171402562   0.50547285754565   0.44610006912319  -0.01978751311791 ...
  -0.13225358368437   0.02180815023739   0.02325180053556  -0.00749349466513 ...
                ];
            
    case 4
        F = [...
   0.11320949129173   0.42697177135271   0.51216347213016   0.09788348067375 ...
  -0.17132835769133  -0.02280056594205   0.05485132932108  -0.00441340005433 ...
  -0.00889593505093   0.00235871396920                                       ...
                ];

    case 5
        F = [...
       0.07887121600143   0.34975190703757   0.53113187994121   0.22291566146505 ...
      -0.15999329944587  -0.09175903203003   0.06894404648720   0.01946160485396 ...
      -0.02233187416548   0.00039162557603   0.00337803118151  -0.00076176690258 ...
                  ];
        
        
    otherwise
  F = [...
   0.05504971537285   0.28039564181304   0.51557424581833   0.33218624110566 ...
  -0.10175691123173  -0.15841750564054   0.05042323250485   0.05700172257986 ...
  -0.02689122629486  -0.01171997078235   0.00887489618962   0.00030375749776 ...
  -0.00127395235906   0.00025011342658                                       ...
                ];
            %If you ever want more cases, you can pull them from dbwavf.m,
            %note that our cases are labelled 1 lower than dbwavf, since we
            %aren't including Haar.

end
h=F;

M=length(h);
g=-(-1).^(1:M).*flip(h);


%Turn on this output for verification
% disp('the Fourier coefficients of Daubechies m0, starting at 0')
% disp(h.')


% m0=zeros(M,1);
% for loop=1:M;
% m0=m0+h(loop)*exp(pi*2i*(loop-3)*((1:M)-1)'/M);
% end

%take samples from m0,m1
[X,Y]=meshgrid((0:N-1)/N,(0:N-1)/N);
m0sx=zeros(N,N);
%m0sy=zeros(N,N);
m1sx=zeros(N,N);
%m1sy=zeros(N,N);
for kk=1:M
m0sx=m0sx+h(kk).*exp(pi*2i*(kk-1)*X);
%m0sy=m0sy+h(kk).*exp(pi*2i*(kk-1)*Y);
m1sx=m1sx+g(kk).*exp(pi*2i*(kk-1)*X);
%m1sy=m1sy+g(kk).*exp(pi*2i*(kk-1)*Y);
end
m0sy=m0sx.';
m1sy=m1sx.';


M0s=reshape(m0sx.*m0sy,[1,1,N,N]);
M1s=reshape(m0sx.*m1sy,[1,1,N,N]);
M2s=reshape(m1sx.*m0sy,[1,1,N,N]);
M3s=reshape(m1sx.*m1sy,[1,1,N,N]);


% 
% %make symbolic functions for m0, m1
% syms xi yi
% m0=vpa(symfun(sum(h(1:M).*exp(pi*2i*(0:M-1)*(xi)))  ,xi),10);
% m1=vpa(symfun(sum(g(1:M).*exp(pi*2i*(0:M-1)*(xi)))  ,xi),10);
% 
% M0=symfun(m0(xi)*m0(yi),[xi,yi]);
% M1=symfun(m0(xi)*m1(yi),[xi,yi]);
% M2=symfun(m1(xi)*m0(yi),[xi,yi]);
% M3=symfun(m1(xi)*m1(yi),[xi,yi]);
% 
% 
% 
% %take samples from m0,m1
% [X,Y]=meshgrid((0:N-1)/N,(0:N-1)/N);
% M0s=reshape(double(M0(X,Y)),[1,1,N,N]);
% M1s=reshape(double(M1(X,Y)),[1,1,N,N]);
% M2s=reshape(double(M2(X,Y)),[1,1,N,N]);
% M3s=reshape(double(M3(X,Y)),[1,1,N,N]);

Umat=zeros(4,4,N,N);
%Create the U matrix 
Umat(1,:,:,:)=[M0s,M1s,M2s,M3s];
Umat(2,:,:,:)=circshift(Umat(1,:,:,:),[0,0,N/2,0]);
Umat([3,4],:,:,:)=circshift(Umat([1,2],:,:,:),[0,0,0,N/2]);


