function [cargs, opts] = common_args(varargin)

  % Add absolute path to code
  if (exist('de_GetBaseDir')~=2)
    addpath(genpath(fullfile('..','..', 'code')));
    addpath(genpath(fullfile('..','..','..', 'code')));
    addpath(genpath(fullfile(de_GetBaseDir(),'code')));
    rmpath (genpath(fullfile('..','..','..', 'code')));
    rmpath (genpath(fullfile('..','..', 'code')));
  end;

  opts = {'small','dnw', false};

  cargs = {  'parallel', false, 'debug', 1:10, 'ac.debug', 1:10, 'p.debug', 1:10, ...
             'runs',    40,          'ac.randState', 2,   'p.randState', 2, ...
             'distn',   {'norme'},    'mu',         0,    'sigma',       [ 4 10 ], ...
             'nHidden', 2*408,       'hpl',       2,    'nConns',      12, ...
             ...% Input
             'ac.zscore', 0.05, ...
             'ac.tol',    0*34/25, ... %tolerance for disconnected pixels
             ... % Training
             'ac.errorType', 2, ...
             'ac.XferFn',   [6 1],        'ac.useBias',  1, ...
             'ac.AvgError', 5E-5,         'ac.MaxIterations', 60, ...
             'ac.dropout', 0.0, ...
             'ac.TrainMode','resilient',      'ac.Pow', 1, ... %gradient power (usually 1)
             'ac.EtaInit',  2.23E-2,         'ac.Acc', 1E-7, 'ac.Dec', 0.25, ... %5E-7 tanh#2, bias=1 resilient
             ...
             'ac.WeightInitScale', 0.01, ...
             'ac.WeightInitType', 'sprand', ...
             'ac.wlim',            [-inf inf], ...
             'ac.noise_input',     0.00, ...
             'ac.lambda',          0.00,         ...% regularization
             ...
             'p.errorType', 2, ...
             'p.WeightInitScale', 0.005, ...
             'p.wlim',            [-inf inf],         ...% regularization
             'p.noise_input',     0,         ...% regularization
             'p.lambda',          0.00,         ...% regularization
             ...
             'ac.rej.props', {'err'},                 'p.rej.props', {'err'}, ... %err,max,nan
             'ac.rej.type',  {'max'},                'p.rej.type',  {'max'}, ...%'sample_std-normd'}, ...
             'ac.rej.width', [NaN],                  'p.rej.width', [NaN], ...%3] ...
             ... %output
             'out.data', {'info','mat'}, ...
             'out.plots', {'png'},  ...
              ...
             varargin{:}
           };
