function templ = makeSITemplate( TI, params )

global V VN
Vold = V;
VNold = VN;

nFiles = numel(TI);
nSIs = 0;
for i = 1:nFiles
    nSIs = nSIs + numel(TI{i}.vtxidx);
end

siDiv = zeros( 2 * params.nb, params.na, 4, nSIs );

for f = 1:nFiles    
    stlfn = TI{f}.modelfn;
    [F, V] = stlread( stlfn );
    [F, V] = uniqueFV( F, V );
    VN = getGSVN( stlfn );
    FV.faces = F;
    FV.vertices = V;
    [pd, ~, ~, ~] =  GetCurvatures( FV ,1 );
    
    vtxidx = TI{f}.vtxidx;
    for i = 1:numel(vtxidx)
        apsi = APSI( V(vtxidx(i),:), params.bintv, params.nb, params.aintv, params.na, pd );
        total = sum(apsi(:));
        siDiv(:,:,:,i) = apsi / total; % È®·ü
    end
end

templ = mean(siDiv, 4);

V = Vold;
VN = VNold;

