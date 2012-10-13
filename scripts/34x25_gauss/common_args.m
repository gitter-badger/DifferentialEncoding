function [cargs, opts] = common_args(varargin)

  % Add absolute path to code
  if (exist('de_GetBaseDir')~=2)
    addpath(genpath(fullfile('..','..', 'code')));
    addpath(genpath(fullfile('..','..','..', 'code')));
    addpath(genpath(fullfile(de_GetBaseDir(),'code')));
    rmpath (genpath(fullfile('..','..','..', 'code')));
    rmpath (genpath(fullfile('..','..', 'code')));
  end;

  opts = {'small','dnw', true};

  cargs = {  'parallel', false, 'debug', 1:10, 'ac.debug', 1:10, 'p.debug', 1:10, ...
             'runs',    40,          'ac.randState', 2,   'p.randState', 2, ...
             'distn',   {'norme'},    'mu',          0,    'sigma',       [ 6.0 10.0 ], ...
             'nHidden', 192*4,        'hpl',         4,    'nConns',      10, ...
             ...% Input
             'ac.zscore', true, ...
             'ac.tol',    0*34/25, ... %tolerance for disconnected pixels
             ... % Training
             'ac.errorType', 2, ...
             'ac.XferFn',   [4 1],        'ac.useBias',  1, ...
             'ac.AvgError', 5E-4,         'ac.MaxIterations', 100, ...
             'ac.TrainMode','batch',      'ac.Pow', 1, ... %gradient power (usually 1)
             'ac.EtaInit',  2E-1,         'ac.Acc', 1.05, 'ac.Dec', 1.5, ... %5E-7 tanh#2, bias=1 resilient
             ...
             'ac.WeightInitScale', 0.01, ...
             'ac.wmax',            inf, ...
             'ac.noise_input',     0.0025, ...
             'ac.lambda',          0.0025,         ...% regularization
             ...
             'p.errorType', 2, ...
             'p.WeightInitScale', 0.005, ...
             'p.wmax',            inf,         ...% regularization
             'p.noise_input',     0,         ...% regularization
             'p.lambda',          0,         ...% regularization
             ...
             'ac.rej.props', {'ti'},                 'p.rej.props', {'err'}, ... %err,max,nan
             'ac.rej.type',  {'max'},                'p.rej.type',  {'sample_std-normd'}, ...
             'ac.rej.width', [NaN],                  'p.rej.width', [3] ...
             ... %output
             'out.data', {'info','mat'}, ...
             'out.plots', {'png'},  ...
             'plots', {'ffts','connectivity','images','hu-encodings','hu-output'}, ...
             'stats', {'ffts','connectivity','images','hu-encodings','hu-output', 'ipd'}, ...
             ...
             varargin{:}
           };
%             'ac.TrainMode','resilient',  'ac.Pow', 1, ... %gradient power (usually 1)
%             'ac.EtaInit',  5E-3,         'ac.Acc', 5E-7, 'ac.Dec', 0.15, ... %tanh#2, bias=1 resilient
