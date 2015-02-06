function [args, opts] = lsb_args(varargin)
%
%  Final shared settings for left-side-bias runs

  % Get shared args
  addpath('..');
  [cargs, opts] = common_args();
  rmpath('..');


  args = de_ArgsInit ( cargs{:}, ... %Network structure
             'runs',10,...
             'p.randState',2,...
             'p.XferFn', 4,               'p.useBias', 1, ...
                                          'p.nHidden', 25, ...
             'p.AvgError',  0,            'p.MaxIterations', 5000, ...
             'p.TrainMode','batch',       'p.Pow', 1, ... %gradient power (usually 1)
             'p.EtaInit',   1E-3,          'p.Acc', 1.001,  'p.Dec', 1.25, ... %tanh#2,bias=1
             'p.lambda',   0.0001,         ...% regularization
             'p.wmax',inf,...
             'p.WeightInitScale',0.01,...
             ... %rejections
             'p.rej.props', {'err'}, ...
             'p.rej.type',  {'sample_std-normd'}, ...
             'p.rej.width', [3], ...
             ... %output
             varargin{:} ); 
