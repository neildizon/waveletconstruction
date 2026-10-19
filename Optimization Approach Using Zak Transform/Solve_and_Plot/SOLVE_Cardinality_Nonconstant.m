%SOLVER FOR THE OPTIMIZATION PROBLEM
%BASED ON THE INTERIOR-POINT METHOD
clear; clc; format long

%CHOOSE STARTING POINT
%x0=rand(6,1);
%x0=[1 3 4 5 6 7].'; %fval 0.
%x0 = [0;1;0;1;0;1]; %fval 0.02
%x0=[1;2;1;0;1;0];   %fval 0.02
%x0=[-1;1;-1;1;1;-1]; %fval 0.23
%x0=[0.4 0.2 -0.3 0.4 0 1]'; %fval 2.12
x0=[0.3900713005 1.191067520 -1.763205219 0.7112070460 1.244439965 0.1808376275].';


%SET UP THE INTERIOR POINT METHOD
        %Q objective function
        %H inequality constraint
        %J equality constraint

load CardinalityObjective; Q=mat;
load CardinalityObjective; H{1}=-mat;
load CardinalityObjective; H{2}=mat;

load J(1); J{1}=mat;
load J(2); J{2}=mat;
load J(3); J{3}=mat;
load J(4); J{4}=mat;
load J(5); J{5}=mat;

f=[0;-1;0.5;0;0;0];

k{1}=[0;1;-0.5;0;0;0];
k{2}=[0;-1;0.5;0;0;0];


p{1}=[0;0;0;0;0;0];
p{2}=[0;0;0;0;0;0];
p{3}=[6;6;0;0;0;0];
p{4}=[-2;-2;0;4;-4;2];
p{5}=[12;8;2;-12;28;-10];

c=0.75;
d{1}=-0.75+0.15;
d{2}=0.50;

q{1}=0;
q{2}=-0.5;
q{3}=-3;
q{4}=-1;
q{5}=5;

%magic number 0.2399517672
options = optimoptions(@fmincon,'Algorithm','interior-point','MaxFunctionEvaluations',15000,'StepTolerance', 1e-12, 'ConstraintTolerance', 1e-12,'OptimalityTolerance', 1e-12,'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true,'HessianFcn',@(x,lambda)quadhess(x,lambda,Q,H,J),'MaxIterations',15000);
%options = optimoptions(@fmincon,'Algorithm','interior-point','MaxFunctionEvaluations',1500,'StepTolerance', 1e-12, 'ConstraintTolerance', 1e-12,'OptimalityTolerance', 1e-12,'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true,'HessianFcn',@(x,lambda)quadhess(x,lambda,Q,H,J),'MaxIterations',1500);
fun = @(x)quadobj(x,Q,f,c);
nonlconstr = @(x)quadconstr(x,H,k,d,J,p,q);

[x,fval,eflag,output,lambda] = fmincon(fun,x0,[],[],[],[],[],[],nonlconstr,options);
%[x,fval,eflag,output,lambda] =
%fmincon(fun,x0,[],[],[],[],[],[],nonlconstr,options);
clc
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

%Uncoded constraints
C6=-8*a^2-6*a*c-6*a*d+6*a*x-6*a*y+12*c^2-12*c*d+6*c*t+12*d^2-6*d*t+t^2+4*x^2-12*x*y+4*y^2-6*x-6*y-9
fval
