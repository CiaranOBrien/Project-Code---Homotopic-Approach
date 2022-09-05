%% Ciaran O'Brien - 6714221
%  Low-Thrust Trajectory Design for Satellite Mega-Constellation Deployment
%  e = 0.6 Transfer FSolver
clear
clc
close all
format longG

X_PSO = [0.300298282052288,0.224987213137037,0.006598722043958,0.668307906766642,0.410121112184245,0.831538040924477,0.799848257206849,0.618018743752118]';

[LambdaX,Lambda0] = XValues2Costate(X_PSO);

X0 = [LambdaX;Lambda0];

options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
[Cos_Opt,FVal,exitflag,output] = fsolve(@F_Solve_Function,X0(:),options);
XOpt = Cos_Opt';