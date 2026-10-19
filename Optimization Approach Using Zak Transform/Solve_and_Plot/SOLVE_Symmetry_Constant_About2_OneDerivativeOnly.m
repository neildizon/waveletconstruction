
%First successful application of the Interior-Point Method
%The basis of cardinalitytrial - with addition constraint to make C zero
%The basis of cardinality2 - to get other minimizer by restricting the
%range allowed for the function value.

clear
clc

%Set up the interior point method
%Q objective function
%H inequality constraint
%J equality constraint

format long
load Qnewnewnew; Q=mat;
%H{1} = zeros(6,6);
load Qnewnewnew; H{1}=-mat;
load Qnewnewnew; H{2}=mat;
load J(1); J{1}=mat;
load J(2); J{2}=mat;
load J(3); J{3}=mat;
load J(4); J{4}=mat;
load J(5); J{5}=mat;
load ConsC2; J{6}=mat;


f=[0.25;0;0.125;0;0;0];

k{1}=-[0.25;0;0.125;0;0;0];
k{2}=[0.25;0;0.125;0;0;0];;

p{1}=[0;0;0;0;0;0];
p{2}=[0;0;0;0;0;0];
p{3}=[6;6;0;0;0;0];
p{4}=[-2;-2;0;4;-4;2];
p{5}=[12;8;2;-12;28;-10];
p{6}=[0;0;0;0;0;0];

c=1/16;
d{1}=-1/16;
d{2}=1/16-1;
q{1}=0;
q{2}=-0.5;
q{3}=-3;
q{4}=-1;
q{5}=5;
q{6}=0;


%Comment this out to satisfy to replace with a constraint corresponding to
%the last equation in the checker
%load J(5)new; J{3}=mat;
%p{3}=[-6; -6; 0; 0; 0; 0];
%q{3}=-9;


options = optimoptions(@fmincon,'Algorithm','interior-point','MaxFunctionEvaluations',150000,'StepTolerance', 1e-12, 'ConstraintTolerance', 1e-12,'OptimalityTolerance', 1e-12,'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true,'HessianFcn',@(x,lambda)quadhess(x,lambda,Q,H,J),'MaxIterations',150000);
%options = optimoptions(@fmincon,'Algorithm','interior-point','MaxFunctionEvaluations',1500,'StepTolerance', 1e-12, 'ConstraintTolerance', 1e-12,'OptimalityTolerance', 1e-12,'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true,'HessianFcn',@(x,lambda)quadhess(x,lambda,Q,H,J),'MaxIterations',1500);
fun = @(x)quadobj(x,Q,f,c);
nonlconstr = @(x)quadconstr(x,H,k,d,J,p,q);

%x0=[-0.625000015522086  -0.624999984477915  -0.000000025652343  -0.500000000081675   0.499999999918325   1.250000000000000].';

x0=rand(6,1)*10;


[x,fval,eflag,output,lambda] = fmincon(fun,x0,[],[],[],[],[],[],nonlconstr,options);
xstar=x;
fval
xstar

%Checker
y=x(2);a=x(3);c=x(4);d=x(5);t=x(6);x=x(1);

C1=-a^2 + 2*x^2 + 2*y^2 - t^2
C2=2*c^2 + 2*d^2 - a^2-1
C3=6*a*c+6*a*d-6*a*x+6*a*y+12*c^2+12*c*d-6*c*t+12*d^2+6*d*t+3*t^2-12*x^2+12*x*y-12*y^2+6*x+6*y-3
C4=a^2+2*a*x-2*a*y+4*c-4*d+2*t-2*x-2*y-1
C5=-5*a^2-4*a*c+4*a*d-2*a*t-12*a*x+8*a*y-8*c*x+8*c*y+8*d*x-8*d*y-4*t*x+4*t*y+8*x^2-8*y^2+2*a-12*c+28*d-10*t+12*x+8*y+5

ConsC2=c^2+d^2-x^2-y^2

%Uncoded constraints
ConsC1=-6*a*c-6*a*d+6*a*x-6*a*y+12*c^2-12*c*d+6*c*t+12*d^2-6*d*t+t^2-12*x^2-12*x*y-12*y^2-6*x-6*y-1
ConsC3=6*a*c+6*a*d-6*a*x+6*a*y+12*c^2+12*c*d-6*c*t+12*d^2+6*d*t+3*t^2-12*x^2+12*x*y-12*y^2+6*x+6*y-3
C6 = -8*a^2-6*a*c-6*a*d+6*a*x-6*a*y+12*c^2-12*c*d+6*c*t+12*d^2-6*d*t+t^2+4*x^2-12*x*y+4*y^2-6*x-6*y-9
y^2 + 1/16 + (1/4)*x + (1/8)*a + (1/4)*x^2 + (1/4)*a*x + (1/16)*a^2
xstar.'