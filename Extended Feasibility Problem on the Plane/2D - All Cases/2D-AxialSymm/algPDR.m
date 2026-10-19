function [U,Uchange]=algPDR(Ustart,D,maxiter,tol)
coltol=10e-16;
%%DOUGLAS-RACHFORD in a product space (CODENAME PDR)
%Setup:Pick a starting point and triple it
U=cat(5,Ustart,Ustart,Ustart,Ustart,Ustart,Ustart,Ustart,Ustart);

[~,~,M,~]=size(Ustart);
%Make Matrices for projections
[P0,P1]=projDMatrix(M,D);

%RUN DR
run=0;test=Inf;
Uchange=NaN(maxiter,2);
Uold=U;
while  run<maxiter && test>tol
    %add to the timer
    run=run+1;

    
    %unitary at full points;unitary at half points;derivatives 0.
    PC=projQUAD(U,P0,P1);
    %PC=projTRIP(U,P);
    
    %Run Douglas-Rachford on the result
    U=U+projAVER(2*PC-U)-PC;
    
    %if mod(run,100)==0
         %Tests whether U remains equal in all three copies
         %Test if U is not changing
            Uchange(run,2)=Ntest(U-Uold);
            %preserve result for testing
            Uold=U;
         %Test if shadow sequence is near a result
            Uchange(run,1)=Ntest(projAVER(PC)-PC);
            test=Uchange(run,1);
            %simple output for the change in U this iteration
            disp(['Shadow: ',num2str(Uchange(run,1)),' Change: ',num2str(Uchange(run,2)),' PDR ', num2str(run)])
   % end
    
    if mod(run,1000)==0
        save('CurrentIterate','U');
    end 
end


while  run<maxiter && test>tol
    %add to the timer
    run=run+1;

    
    %unitary at full points;unitary at half points;derivatives 0.
    PC=projQUAD(U,P0,P1);
    %PC=projTRIP(U,P);
    
    %Run Douglas-Rachford on the result
    U=circum2(U, 2*PC-U, 2*projAVER(2*PC-U) - 2*PC + U,coltol);
    
    %if mod(run,100)==0
         %Tests whether U remains equal in all three copies
         %Test if U is not changing
            Uchange(run,2)=Ntest(U-Uold);
            %preserve result for testing
            Uold=U;
         %Test if shadow sequence is near a result
            Uchange(run,1)=Ntest(projAVER(PC)-PC);
            test=Uchange(run,1);
            %simple output for the change in U this iteration
            disp(['Shadow: ',num2str(Uchange(run,1)),' Change: ',num2str(Uchange(run,2)),' GCR ', num2str(run)])
   % end
    
    if mod(run,1000)==0
        save('CurrentIterate','U');
    end 
end








%U=mean(PC,5);
U=sum(PC,5)/size(PC,5);
disp(['DOUGLAS-RACHFORD:',num2str(run),' iterations of DR'])
%And the reason why AP ended
if run==maxiter
    warning('DR HIT MAXITER')
else
    disp('Potential convergence')
end

Uchange=Uchange(1:run,:);


