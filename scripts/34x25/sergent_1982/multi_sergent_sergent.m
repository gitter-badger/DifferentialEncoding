% Sergent stims, task, and target set, using cross-entropy error
clear all variables;

stats = {};%{'images','ffts'};
plts = {'ls-bars', stats{:}};

[args,opts] = uber_sergent_args('plots',plts,'stats',stats,'runs',25, ...
                           'deType', 'de', 'p.ndupes', 25, 'p.MaxIterations', 50, 'p.nHidden', 10, 'p.EtaInit', 5E-3, 'p.Acc', 1.001);
% Run sergent task by training on all images
[trn, tst] = de_SimulatorUber('uber/natimg', 'sergent_1982/de/sergent',         opts, args);
