function main(iter)


M=6;
D=M/2-1;
tol=10^-6;
maxiter=3000000;


Ustart=projJ(projK(rand(4,4,M,M)+1i*rand(4,4,M,M)));
U = cat(5,Ustart,Ustart,Ustart,Ustart,Ustart,Ustart);
[~,~,M,~]=size(Ustart);
save(['RealResults',num2str(iter)],'Ustart');


%Make Matrices for projections
[P0,P1]=projDMatrix(M,D);

%RUN DR
run=0;test=Inf;
Uchange=NaN(maxiter,2);
Uold=U;
tic;

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
            %disp(['Shadow: ',num2str(Uchange(run,1)),' Change: ',num2str(Uchange(run,2)),' PDR ', num2str(run)])
   % end
    
    if mod(run,1000)==0
        mytest=Uchange(run,1);
        save(['RealResults',num2str(iter)],'U','-append');
        save(['RealResults',num2str(iter)],'mytest','-append');
        save(['RealResults',num2str(iter)],'run','-append');
    end 
end

U=sum(PC,5)/size(PC,5);
time=toc;
PDR=U;

save(['RealResults',num2str(iter)],'time','-append');
save(['RealResults',num2str(iter)],'Uchange','-append');
save(['RealResults',num2str(iter)],'PDR','-append');
save(['RealResults',num2str(iter)],'run','-append');
end
