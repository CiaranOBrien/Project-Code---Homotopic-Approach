%% Ciaran O'Brien - 6714221
%  Low-Thrust Trajectory Design for Satellite Mega-Constellation Deployment
%  e = 0.8 Transfer FSolver
clear
clc
close all
format longG

X_PSO = [0.299498674203754,0.451949863411938,0.012764148604679,0.001321909034528,0.315536270879991,0.361155776891073,0.999485624994937,0.090583706318824]';

[LambdaX,Lambda0] = XValues2Costate(X_PSO);

X0 = [LambdaX;Lambda0];

options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
[Cos_Opt,FVal,exitflag,output] = fsolve(@F_Solve_Function,X0(:),options);
XOpt = Cos_Opt';