function [U,Uchange,run,time,rem]=algPDR(Ustart,D,maxiter,tol)
U=cat(4,Ustart,Ustart,Ustart,Ustart,Ustart); %Setup:Take the starting point and triple it
run=0; test=Inf;
Uchange=NaN(maxiter,1);
tic;

while  run<maxiter && test>tol
    run=run+1;
    PC=projAVER(U);
            Uchange(run,1)=Ntest(PC-projTRIP(PC,D));
            test=Uchange(run,1); %Stopping criterion
            %disp(['Shadow: ',num2str(Uchange(run,1))]);
    U=U+projTRIP(2*PC-U,D)-PC;
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