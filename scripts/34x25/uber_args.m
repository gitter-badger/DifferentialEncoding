function [cargs, opts] = uber_args(varargin)

  [cargs,opts] = common_args( ...
            'runs',    25, ...
            'errorType', 1, ...
            ...
            'ac.TrainMode','resilient-homeostatic', ...
            'ac.Pow', 1, ... %gradient power (usually 1)
            'ac.AvgError', 1E-4, ...
            'ac.EtaInit', 7.02E-2, ...
            'ac.Acc', 5E-5, ...
            'ac.Dec', 0.25, ... %5E-7 tanh#2, bias=1 resilient
            'ac.MaxIterations', 100, ...
            'ac.lambda', 0.0, ...
            'ac.noise_input', 0.0025, ...
            'ac.avgact', 0.01, ...
            'ac.bn', 3.3E-4, 'ac.bc', 3.3E-5, ...
...%            'ac.rej.width', [3], 'ac.rej.type', {'sample_std-normd'}, ...
            'ac.rej.width', [NaN], 'ac.rej.type', {'max'},...sample_std-normd'}, ...
            'p.errorType', 3,... % cross-entropy
            'p.XferFn', [6 3], ...  %sigmoid->sigmoid
            'p.TrainMode', 'resilient', ...
            'p.EtaInit', 5E-2, ...
            'p.Acc', 1E-7, ...
            'p.Dec', 0.25, ...
              ...
             varargin{:} ...
           );

  opts = {opts{:}, 'img2pol','location','LVF'};
