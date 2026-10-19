function [U,Uchange,run,time,rem]=algPDR_plot(Ustart,D,maxiter,tol)

U=cat(4,Ustart,Ustart,Ustart,Ustart,Ustart); %Setup:Take the starting point and triple it
run=0; test=Inf;
Uchange=NaN(maxiter,2);
Uold=U;
tic;
while  run<maxiter && test>tol
    run=run+1;
    
    PC=projAVER(U);
            Uchange(run,1)=Ntest(PC-projTRIP(PC,D)); %Change in shadow sequence
            test=Uchange(run,1); %Stopping criterion
    U=U+projTRIP(2*PC-U,D)-PC;    
            Uchange(run,2)=Ntest(U-Uold); %Change in DR iterates
            Uold=U;
    disp(['Shadow: ',num2str(Uchange(run,1)),' Change: ',num2str(Uchange(run,2))])
end
time=toc;
if test<tol
    rem=1;
else
    rem=0;
end

U=sum(PC,4)/5;
Uchange=Uchange(1:run,:);
end