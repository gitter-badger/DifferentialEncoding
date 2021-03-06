% Try training a deep autoencoder, with each layer representing an image
addpath('../sergent_1982');
clear all variables;

stats = {'ipd'};%{'images','ffts'};
plts = {'ls-bars', stats{:}};

[args,opts] = uber_sergent_args('plots',plts,'stats',stats,'runs',25, ...
                           'deType', 'de-stacked', ...
                           'p.MaxIterations', 101 ...
                           );

% Run sergent task by training on all images
[trn, tst] = de_SimulatorUber('uber/natimg', 'sergent_1982/de/sergent',         opts, args);
