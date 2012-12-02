% Testing the effect of transforming the images to r/theta coordinates,
%   a la Plaut & Behrmann 2011
addpath('../sergent_1982');
clear all variables; clear all globals;

stats = {'images','ffts'};%{'images','ffts'};
plts = {'ls-bars', stats{:}};

[args,opts]  = uber_sergent_args('plots',plts,'stats',stats,'runs',2);

% Run sergent task by training on all images
[trn, tst] = de_SimulatorUber('vanhateren/100', 'sergent_1982/de/sergent', {opts{:}, 'contrast', 'low'}, args);
