function [args,opts] = uber_christman_args(varargin)
%
%  Final shared settings for left-side-bias runs
  % Get shared args
  addpath('..');
  [args,opts] = uber_args( ...
                  'runs',   10, ...
                  'errorType', 2, ...
                  'p.errorType', 2,... % cross-entropy
                  'p.XferFn', [6 3], ...  %sigmoid->sigmoid
                  'p.zscore', 0.10, ...
                  'p.EtaInit', 5E-3, ...
                  'p.TrainMode', 'resilient', ...
                  'p.Acc', 3E-7, 'p.Dec', 0.25, ...
                  'p.dropout', 0.5, ...
                  'p.nHidden', 100, ...
                  'p.wlim', 0.5*[-1 1], ...
                  'p.lambda',0.00,...
                  'p.MaxIterations', 1000, ...
                  ...%'p.MaxError', 0.01, 'p.rejWidth', NaN, 'p.rejType', 'sample_std', ...
                  varargin{:} ...
                );

%  cycles = [5 12]; % are we sure about this?
%  opts = {opts{:}, 'cycles', cycles};

