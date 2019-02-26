function [F, Vres, E, ReliefLabels, resSim] = re_SIRules( fn, Templs)
% [F, Vres, E, ReliefLabels, resSim] = re_SIRules( fn, Templs )

global V VN

[F, V] = stlread( fn );
[F, V] = uniqueFV( F, V );
VN = getGSVN( fn );
E = uniqueEfromF(F);
FV.faces = F;
FV.vertices = V;

[ReliefLabels, resSim] = extractReliefSIRules( V, E, Templs, FV);
% figure, drawscatter( V, labelVertex2rgb(ReliefLabels) )
figure, drawscatter( V, ReliefLabels>0 )

Vres = V;

clear global V VN


































