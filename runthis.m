clear
global at it
[at , it] = textread('data-1.asc', '%f %f')
% Parameters
theta1 = -1;
R = -3;

[V_0,V_1,Pr_1]=main(-1,-3)

%%%% Question 4
param = [-1,-3]
% Optimizing parameters
options = optimset('TolX',1e-8,'TolFun',1e-8,'MaxFunEvals',1e8,'MaxIter',1e8)

% Optimization routine
[betahat,fval,exitflag,output] = fminsearch(@Likelihood, param, options) 

[VBar0,VBar1,p1]=main(-1.1484,-4.4464)