%% Ciaran O'Brien - 6714221
%  Low-Thrust Trajectory Design for Satellite Mega-Constellation Deployment
%  e = 0.2
clear
clc
close all
format longG

X_PSO = [0.635553211088519,0.947560459013557,0.054314105487270,0.521808077671122,0.842584437211164,0.735499273078900,0.144907989500638,0.651987540644771]';

[LambdaX,Lambda0] = XValues2Costate(X_PSO);

X0 = [LambdaX;Lambda0];

options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
[Cos_Opt,FVal,exitflag,output] = fsolve(@F_Solve_Function,X0(:),options);
XOpt = Cos_Opt';