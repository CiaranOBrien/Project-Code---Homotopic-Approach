%% Ciaran O'Brien - 6714221
%  Low-Thrust Trajectory Design for Satellite Mega-Constellation Deployment
%  e = 0.4 Transfer PSO
clear;
clc;
close all; 
format longG;

%% Inputs
[inp,pars] = Constants;

%% Partical Swarm Optimizarion Setup
pars = PSOSetup(pars);

%% Partical Swarm Optimization
[xPSO,FvalPSO,exitFlagPSO,OutputPSO] = particleswarm(@(X_PSO)E04_PSO(X_PSO,pars), pars.PSO.nvars,pars.PSO.lb, pars.PSO.ub, pars.PSO.options);
