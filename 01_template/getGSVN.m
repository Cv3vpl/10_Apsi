function sVN = getGSVN( fn )

gsfn = getGaussianSmoothedNormalFN( fn );

if exist( gsfn, 'file' )
    load(gsfn);
    return;
end

[F, V] = stlread( fn );
[F, V] = uniqueFV( F, V );
VN = STLVertexNormals(F, V);
nV = size(V,1);
ngbrsigma = 2.5;

%% Gaussian smoothing
% average edge length -> avgedgelen
E = uniqueEfromF(F);
% edge length
L = sqrt(sum((V(E(:,1), :) - V(E(:,2), :)).^2, 2));

len = sum(L)/(length(E)); % 3D mesh edge
c = 4.0 * 10^(-3) * len^2;
sigma = linspace(0.6*len, 6*len, 10);

sVNs  = zeros( [length(sigma), size(VN)] );
lvs   = zeros( [length(sigma), nV] );
objEs = zeros( [length(sigma), nV] );
for ii = 1:length(sigma)
    sVN = gauss3dsmoothing( V, VN, ngbrsigma * sigma(ii), sigma(ii) );    
    lvs(ii, :) = localVarianceN( V, sVN, ngbrsigma * sigma(ii) );
    objEs(ii, :) = (c / sigma(ii).^2) + lvs(ii, :).^2;
    sVNs(ii, :, :) = sVN;
end

[~,sigmabestidx] = min( objEs );

for ii = 1:nV
    sVN(ii,:) = sVNs(sigmabestidx(ii), ii, :);
end
save( gsfn, 'sVN' );    