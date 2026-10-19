function phik = phi(k)
if k==3
   phik=1.059571862728294;
elseif k==4
   phik= -0.067560427633691;
elseif k==5
   phik=0.000478835417815;
elseif k==6
   phik=0.007509729487582;
elseif mod(k, 1)==0
   phik=0;
else 
   error('Input is not an integer') 
end
   
    