function [labels, resSim] = extractReliefSIRulesParam( V, E, templ, ruleParam )
% [labels, resSim] = extractReliefSIRules( V, E, templ )
%
% extract relief based on some rules
% labels: relief label
% resSim: SI similarity measure

resSim = simMeasureSITemplate( V, templ.T, templ.params, @NLC );
% resSim : SI similarity measures (NLC) w.r.t. three classes;
%          relief, relief boundary, background

nV = size(resSim, 1);
candidates = resSim(:,1) > resSim(:,3) * ruleParam(1); %1.1
cand_grps = conComp( E, candidates );

accurateCandidates = resSim(:,1) > ruleParam(2); %0.85
ac_grps = conComp( E, accurateCandidates );

cand_labels = labelVertexGroup( cand_grps, nV );

good_cand_label_idx = [];
ngrps = numel(ac_grps);
for i = 1:ngrps
    good_cand_label_idx = unique([good_cand_label_idx; cand_labels(ac_grps{i})]);
end

labels = zeros( nV, 1 );
for i = 1:numel(good_cand_label_idx)
    j = good_cand_label_idx(i);
    if(j <= 0) 
        continue;
        %h = msgbox('There is no reliefs');
    end
    labels( cand_grps{j} ) = i;
end