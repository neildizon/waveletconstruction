function [P,Ph] = projDmatrixQ(M,D)
TD = (D+1)*(D+2)/2;
M2=M*M;

alpha1 = zeros(TD-1,1);
alpha2 = zeros(TD-1,1);
counter = 1;
for jj=0:D
    for kk=0:D
        if jj+kk<=D && jj+kk>0
        alpha1(counter)=jj;
        alpha2(counter)=kk;
        counter = counter + 1;
        end
    end
end

[X,Y] = meshgrid(0:M-1,0:M-1);
J1=Y(:);
J2=X(:);

%For row 1 columns 2 3 4
R=zerosq(TD-1,M2);
for acount = 1:TD-1
    for ccount = 1:M2
        for k1=1:M
            for k2=1:M
            R(acount,ccount) = R(acount,ccount) + ((k2-1)^alpha1(acount))*((k1-1)^alpha2(acount))*exp(2*pi*qk*wedge([k1-1 k2-1],[J1(ccount) J2(ccount)])/M);
            end
        end
     end
end


%For row 1 columns 1 2 3
Rp=zerosq(TD-1,M2);
for acount = 1:TD-1
    for ccount = 1:M2
        for k1=1:M
            for k2=1:M
            Rp(acount,ccount) = Rp(acount,ccount) + ((-1)^(k2-1))*((k2-1)^alpha1(acount))*((k1-1)^alpha2(acount))*exp(2*pi*qk*wedge([k1-1 k2-1],[J1(ccount) J2(ccount)])/M);
            end
        end
     end
end
Rq=zerosq(TD-1,M2);
for acount = 1:TD-1
    for ccount = 1:M2
        for k1=1:M
            for k2=1:M
            Rq(acount,ccount) = Rq(acount,ccount) + ((-1)^(k1-1))*((k2-1)^alpha1(acount))*((k1-1)^alpha2(acount))*exp(2*pi*qk*wedge([k1-1 k2-1],[J1(ccount) J2(ccount)])/M);
            end
        end
     end
end
Rpq=zerosq(TD-1,M2);
for acount = 1:TD-1
    for ccount = 1:M2
        for k1=1:M
            for k2=1:M
            Rpq(acount,ccount) = Rpq(acount,ccount) + ((-1)^((k2-1)-(k1-1)))*((k2-1)^alpha1(acount))*((k1-1)^alpha2(acount))*exp(2*pi*qk*wedge([k1-1 k2-1],[J1(ccount) J2(ccount)])/M);
            end
        end
     end
end

Rh = [Rp; Rq; Rpq];

P=R'*inv(R*R')*R;
P=eye(M2)-P;

Ph=Rh'*inv(Rh*Rh')*Rh;
Ph=eye(M2)-Ph;
end



