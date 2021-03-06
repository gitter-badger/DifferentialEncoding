function [rejMats] = de_FindRejectionsAC(mss, rejSets, stats, rejMats)
%
%

  if (~iscell(mss))
    mss = guru_num2cell(mss, 1);
  end;

  nSigmas = length(mss);

  %
  if (~exist('rejMats','var') || isempty(rejMats))
    rejMats = cell(nSigmas,1);
    for k=1:nSigmas
        rejMats{k} = zeros(length(mss{k}), 0);
    end;
  end;

  for k=1:nSigmas
      rejMats{k}(:,end+1:end+3) = zeros(length(mss{k}), 3);

      if (~isempty(rejSets))
      % Total hack, I don't have time to deal with this right now.
      rejSets.width(isnan(rejSets.width) & strcmp(rejSets.props, 'err')) = mss{k}(1).ac.Error;
      rejSets.width(isnan(rejSets.width) & strcmp(rejSets.props, 'ti'))  = mss{k}(1).ac.MaxIterations;


      rejMats{k}(:,end-2) = de_FindRejections_PerStat(mss{k}, de_GetRejSets(rejSets, 'err'), stats.ac.err{k});
      rejMats{k}(:,end-1) = de_FindRejections_PerStat(mss{k}, de_GetRejSets(rejSets, 'tt'),  stats.ac.tt{k});
      rejMats{k}(:,end-0) = de_FindRejections_PerStat(mss{k}, de_GetRejSets(rejSets, 'ti'),  stats.ac.ti.vals{k});
      end;
  end
