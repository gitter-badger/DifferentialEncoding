function [args,opts] = uber_kitterle_args(varargin)
%
%  Final shared settings for left-side-bias runs
  % Get shared args
  addpath('..');
  [args,opts] = uber_args( ...
                  'runs',   2, ...
                  'p.zscore', 0.1, ... %0.25
                  'p.EtaInit', 3E-3, ...
                  'p.TrainMode', 'resilient', 'p.Pow', 1, ...
                  'p.Acc', 3E-5, 'p.Dec', 0.25, ...
                  'errorType', 2, 'p.errorType', 2, ...
                  'p.XferFn', [6 3], ...
                  'p.dropout', 0.0, ...
                  'p.nHidden', 100, ...
                  'p.wlim', 0.5*[-1 1], ...
                  'p.lambda',0.00,...
                  'p.noise_input', 0.0, ...
                  'p.MaxIterations', 1500, ...
                  varargin{:} ...
                );

%  cycles = [5 12]; % are we sure about this?
%  opts = {opts{:}, 'cycles', cycles};
