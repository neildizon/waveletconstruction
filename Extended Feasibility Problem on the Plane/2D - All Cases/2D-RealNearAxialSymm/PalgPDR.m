function [NUseq,Uchange]=PalgPDR(NUseq,D,maxiter,tol)

%%DOUGLAS-RACHFORD in a product space (CODENAME PDR)
%This minor edit of algPDR wants input and output already in the product
%space. It also doesn't produce update text or do the final projection on
%the shadow sequence required to "complete" PDR.

%The purpose of this is to be able to pause and restart PDR.

[~,~,M,~,~]=size(NUseq);
%Make Matrices for projections
[P0,P1]=projDMatrix(M,D);

%RUN DR
run=0;test=Inf;
Uchange=NaN(maxiter,2);
Uold=NUseq;
while  run<maxiter && test>tol
    %add to the timer
    run=run+1;

    
    %unitary at full points;unitary at half points;derivatives 0.
    PC=projQUAD(NUseq,P0,P1);
    %PC=projTRIP(U,P);
    
    %Run Douglas-Rachford on the result
    NUseq=NUseq+projAVER(2*PC-NUseq)-PC;
    
    %if mod(run,100)==0
         %Tests whether U remains equal in all three copies
         %Test if U is not changing
            Uchange(run,2)=Ntest(NUseq-Uold);
            %preserve result for testing
            Uold=NUseq;
         %Test if shadow sequence is near a result
            Uchange(run,1)=Ntest(projAVER(PC)-PC);
            test=Uchange(run,1);
            %simple output for the change in U this iteration
           % disp(['Shadow: ',num2str(Uchange(run,1)),' Change: ',num2str(Uchange(run,2))])
   % end
    
    
end
%U=mean(PC,5);
%NUseq=sum(PC,5)/size(PC,5);
disp(['PDR:',num2str(run),' iterations of DR'])
%And the reason why AP ended
if run==maxiter
    disp('PDR ran until maxiter')
else
    disp('Potential convergence')
end

Uchange=Uchange(1:run,:);


