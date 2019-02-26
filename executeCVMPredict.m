function [label,score] = executeCVMPredict(stlName,SVMModel)

global V VN

params.aintv = 0.3; % mm unit
params.bintv = 0.2; % mm unit
params.na = 10;
params.nb = 7;

[F, V] = stlread(stlName);
[F, V] = uniqueFV( F, V );
VN = getGSVN(stlName);

FV.faces = F;
FV.vertices = V;
[~, pd, ~, ~] =  GetCurvatures( FV ,1 );

for i = 1:size(V,1)
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    predictInputSI(i,:) = siData;
end

[label,score] = predict(SVMModel,predictInputSI);

drawPredictLabel(V,label);