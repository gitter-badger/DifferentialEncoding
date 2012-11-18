function [cargs, sz] = common_args(varargin)

  % Add absolute path to code
  if (~exist('de_GetBaseDir')==2)
    addpath(genpath(fullfile('..','..','..', 'code')));
    addpath(genpath(fullfile(de_GetBaseDir(),'code')));
    rmpath (genpath(fullfile('..','..','..', 'code')));
  end;
  
  sz = [34 25];
  
  cargs = { ...
             'distn',   {'norme'}, 'mu',            0,    'sigma',       [ 3.0 11.0 ], ...
             'nHidden', 192*4,       'hpl',         4,    'nConns',      8, ...
             ...% Input
             'ac.randState', 2, ...
             'ac.tol',       0/403, ... %tolerance for disconnected pixels
             ... % Training
             'ac.XferFn',   6,            'ac.useBias',  1, ...
             'ac.AvgError', 5.1E-3,        'ac.MaxIterations', 100, ...
             'ac.TrainMode','resilient',  'ac.Pow', 3, ... %gradient power (usually 1)
             'ac.EtaInit',  5E-3,         'ac.Acc', 5E-7, 'ac.Dec', 0.15, ... %tanh#2, bias=1 resilient
             'ac.lambda',   0.01, ...%[0.02 0.01],  ...% regularization
             ... %rejections
             'ac.rej.props', {'err'},   'p.rej.props', {'err'}, ...
             'ac.rej.type',  {'max'},   'p.rej.type',  {'sample_std-normd'}, ...
             'ac.rej.width', [nan],     'p.rej.width', [3] ...
             ... %output
             'out.data', {'info','mat'}, ...
             'out.plots', {'png'}  ...
           };
