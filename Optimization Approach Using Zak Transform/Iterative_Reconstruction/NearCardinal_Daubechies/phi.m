function phik = phi(k)
if k==1
   phik=1.286335069367837;
elseif k==2
   phik=-0.385836960980011;
elseif k==3
   phik=0.095267545998580;
elseif k==4
   phik=0.004234345613594;
elseif mod(k, 1)==0
   phik=0;
else 
   error('Input is not an integer') 
end
   
    