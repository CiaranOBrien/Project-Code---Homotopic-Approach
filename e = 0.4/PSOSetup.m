function pars = PSOSetup(pars)

%% Boundaries for X
% First value is to find Time of FLight, the remaining 8 are for the Beta
% Values and Costates
lb = [0.1; eps*ones(7,1)];
ub = [ones(8,1)];
nvars = 8; 

pars.PSO.lb = lb;
pars.PSO.ub = ub;
pars.PSO.nvars = nvars;

%% PSO Options

IterNum   = 1e4;
SwarmSize = 6e1;
ParaFlag  = true;
TimeLim   = 7.0*86400;


%% PSO options
options = optimoptions('particleswarm');

options = optimoptions(@particleswarm,'PlotFcn','pswplotbestf');

options = optimoptions(options, 'Display', 'iter');     

options = optimoptions(options, 'FunctionTolerance', 1e-6);

options = optimoptions(options, 'HybridFcn', 'fmincon');

options = optimoptions(options, 'MaxIterations', IterNum);

options = optimoptions(options, 'MaxStallIterations', 50);

options = optimoptions(options, 'MaxTime', TimeLim);

options = optimoptions(options, 'OutputFcn', @PSO_Output);

options = optimoptions(options, 'SwarmSize', SwarmSize);

options = optimoptions(options, 'UseParallel', ParaFlag);

options = optimoptions(options, 'UseVectorized', false);

pars.PSO.options = options;

end

