% Train the autoencoder
n_ac = 5;
tasks = {'sergent' 'kitterle' 'christman'};

%%%%%%%%%%%%%%%%
% Run the autoencoder & gather output
%%%%%%%%%%%%%%%%%


[args]  = vanhateren_args( 'runs', n_ac );

[mSets, models, stats] = de_Simulator('vanhateren', 'all', '', {'small'}, args{:}, 'ac.force',1);


% Get the autoencoder directories
ac = [models(1,:).ac];
dirs = cell(size(ac));
for i=1:length(ac)
   dirs{i} = guru_fileparts(ac(i).fn, 'path');
end;
clear('ac');


%%%%%%%%%%%%%%%%
% Run each task
%   ** in the order requested **
%%%%%%%%%%%%%%%%%
p_args = { args{:}, ...
          'uberpath', dirs, ...
          'plots', {}, 'stats', {}, ...
          'p.XferFn', 4,               'p.useBias', 1, ...
          'p.AvgError',  0,            ...
          'p.TrainMode','batch',       'p.Pow',  1 ...
          'p.lambda', 0 ...
         };

for ti=1:length(tasks)
    
    
    if (strcmp('sergent',tasks{ti}))
    
        
        % Sergent
        s_args = { p_args{:}, 'runs', min(n_ac, 68), ...
                  'plots', {'ls_bars'},  ...
                  'p.nHidden', 1, ...
                  'p.MaxIterations', 1000, ...
                  'p.EtaInit',   0.01,    ...
                  'p.Acc',  1.0025,  'p.Dec'  1.25 ... %sig,bias=0
                 };
        de_Simulator('sergent_1982', 'de', 'sergent', {'nInput',sz}, s_args{:}, 'plots', {'ls_bars', 'ffts', 'images'}, 'stats', {'ffts','images'} );
        de_Simulator('sergent_1982', 'de', 'sergent', {'nInput',sz,'D1#T1'}, s_args{:});
        de_Simulator('sergent_1982', 'de', 'sergent', {'nInput',sz,'D1#T2'}, s_args{:});
        de_Simulator('sergent_1982', 'de', 'sergent', {'nInput',sz,'D2#T1'}, s_args{:}); %rezad
        de_Simulator('sergent_1982', 'de', 'sergent', {'nInput',sz,'D2#T2'}, s_args{:});
        de_Simulator('sergent_1982', 'de', 'sergent', {'nInput',sz,'swapped'}, s_args{:});
    end;
    
    
    % Kitterle
    if (strcmp('kitterle', tasks{ti}))
        k_args  = { p_args{:}, 'runs', min(n_ac, 40), ...
                     'p.nHidden', 10, ...
                     'p.MaxIterations', 500, ...
                     'p.EtaInit',   1E-2,         'p.Acc',  1.01,  'p.Dec',  1.25, ... %sig,bias=0
                   };
        de_Simulator('kitterle_etal_1992', 'sf_mixed', 'recog_freq', {'nInput',sz,'freqs', k_freqs}, k_args{:}, 'plots', {'ffts', 'images'}, 'stats', {'ffts', 'images'});
        de_Simulator('kitterle_etal_1992', 'sf_mixed', 'recog_type', {'nInput',sz,'freqs', k_freqs}, k_args{:});
    end;
    
    
    % Christman
    if (strcmp('christman', tasks{ti}))
        c_args  = { p_args{:}, 'runs', min(n_ac, 64), ...
                    'p.nHidden', 15, ...
                    'p.MaxIterations', 2500, ...
                    'p.EtaInit',   1E-3,         'p.Acc',  1.001,  'p.Dec',  1.15, ... %sig,bias=0
                    'plots', {'ffts', 'images'}, 'stats', {'ffts', 'images'}, ...
                  };
        de_Simulator('christman_etal_1991', 'low_freq',  'recog', {'nInput',sz,'freqs', c_freqs, 'thetas', c_thetas}, c_args{:});
        de_Simulator('christman_etal_1991', 'high_freq', 'recog', {'nInput',sz,'freqs', c_freqs, 'thetas', c_thetas}, c_args{:});
    end;
    
    
    % Young
    if (strcmp('young', tasks{ti}))
        y_args  = { p_args{:}, 'runs', min(n_ac, 50), ...
                    'p.nHidden', 25, ...
                    'p.MaxIterations', 5000, ...
                    'p.EtaInit',   1E-3,         'p.Acc',  1.001,  'p.Dec',  1.15, ... %sig,bias=0
                    'plots', {'ffts'}, 'stats', {'ffts'}, ...
                   };
        de_Simulator('young_bion_1981', 'orig',  'recog', {'nInput',sz}, y_args{:});
    end;
end;
