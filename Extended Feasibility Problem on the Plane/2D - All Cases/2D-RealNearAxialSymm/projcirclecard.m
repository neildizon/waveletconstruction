function Z=projcirclecard(a,B,z,EPS)
Z=zeros(size(z));
if norm(dot(a,z)+B) <= EPS
    Z=z;
else 
    b=EPS*(dot(a,z)+B)/norm(dot(a,z)+B);
    c=(b-dot(a,z)-B)/(norm(a))^2;
    Z=z+c*a;
end
end
