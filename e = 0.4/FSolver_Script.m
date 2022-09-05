%% Ciaran O'Brien - 6714221
%  Low-Thrust Trajectory Design for Satellite Mega-Constellation Deployment
%  e = 0.4 Transfer FSolver
clear
clc
close all
format longG

X_PSO = [0.299838473435063,0.192763524069855,0.007765579866697,0.747541730536995,0.399729230476270,0.800517099378040,0.825008942337645,0.565658564214073]';

[LambdaX,Lambda0] = XValues2Costate(X_PSO);

X0 = [LambdaX;Lambda0];

options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
[Cos_Opt,FVal,exitflag,output] = fsolve(@F_Solve_Function,X0(:),options);
XOpt = Cos_Opt';