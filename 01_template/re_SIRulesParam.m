function [F, Vres, E, ReliefLabels, resSim] = re_SIRulesParam( fn, Templs, ruleParam )
% [F, Vres, E, ReliefLabels, resSim] = re_SIRules( fn, Templs )

global V VN

[F, V] = stlread( fn );
[F, V] = uniqueFV( F, V );
VN = getGSVN( fn );
E = uniqueEfromF(F);

[ReliefLabels, resSim] = extractReliefSIRulesParam( V, E, Templs, ruleParam );
figure, drawscatter( V, labelVertex2rgb(ReliefLabels) )

Vres = V;

clear global V VN


































