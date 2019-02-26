function meas = makeWilcoxonParam( TI, params )

global V VN
Vold = V;
VNold = VN;

nFiles = numel(TI);
nSIs = 0;
for i = 1:nFiles
    nSIs = nSIs + numel(TI{i}.vtxidx);
end

siDiv = zeros( 2 * params.nb, params.na, nSIs );

for f = 1:nFiles
    stlfn = TI{f}.modelfn;
    [F, V] = stlread( stlfn );
    [F, V] = uniqueFV( F, V );
    VN = getGSVN( stlfn );
    
    vtxidx = TI{f}.vtxidx;
    for i = 1:numel(vtxidx)
        si = SI( V(vtxidx(i),:), params.bintv, params.nb, params.aintv, params.na );
        meas(i,:) = si(:)';
    end
end

V = Vold;
VN = VNold;

