function Z=projcircle(a,z,EPS)
Z=zeros(size(z));
if norm(dot(a,z)) <= EPS
    Z=z;
else 
    b=EPS*dot(a,z)/norm(dot(a,z));
    c=(dot(a,z)-b)/(norm(a))^2;
    Z=z-c*a;
    %Z=EPS*z/norm(dot(z,a));
end
end
