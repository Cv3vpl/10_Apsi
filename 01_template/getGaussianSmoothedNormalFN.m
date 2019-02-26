function gsfn = getGaussianSmoothedNormalFN( fn )

[filepath, name, ext] = fileparts( fn );
gsfn = fullfile( filepath, ['gsn_', name, '.mat'] );