function [nae, jak, do, bu, ja, neon, chuk, ji, du] = makeSVMInputData()

global V VN

params.aintv = 0.1; % mm unit
params.bintv = 0.1; % mm unit
params.na = 5;
params.nb = 5;

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

[F, V] = stlread( 'aligned_good_ajjine.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_good_ajjine.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_ajjine.mat');
label = label.ReliefLabels;
% 

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;
    end
end

nae.SI = [backgroundSI; reliefSI]';
nae.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    nae.Label(i) = {'Background'};
end

idx = size(nae.Label,2);

for i = 1:size(reliefSI,1)
    nae.Label(idx+i) = {'Relief'};
end

nae.Label = nae.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_average_jak.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_average_jak.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_jak.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;%
    end
end

jak.SI = [backgroundSI; reliefSI]';
jak.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    jak.Label(i) = {'Background'};
end

idx = size(jak.Label,2);

for i = 1:size(reliefSI,1)
    jak.Label(idx+i) = {'Relief'};
end

jak.Label = jak.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_average_doeubdo.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_average_doeubdo.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_doeubdo.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;%
    end
end

do.SI = [backgroundSI; reliefSI]';
do.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    do.Label(i) = {'Background'};
end

idx = size(do.Label,2);

for i = 1:size(reliefSI,1)
    do.Label(idx+i) = {'Relief'};
end

do.Label = do.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_average_jiabibu.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_average_jiabibu.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_jiabibu.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;%     
    end
end

bu.SI = [backgroundSI; reliefSI]';
bu.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    bu.Label(i) = {'Background'};
end

idx = size(bu.Label,2);

for i = 1:size(reliefSI,1)
    bu.Label(idx+i) = {'Relief'};
end

bu.Label = bu.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_average_nomja.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_average_nomja.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_average_nomja.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;
    end
end

ja.SI = [backgroundSI; reliefSI]';
ja.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    ja.Label(i) = {'Background'};
end

idx = size(ja.Label,2);

for i = 1:size(reliefSI,1)
    ja.Label(idx+i) = {'Relief'};
end

ja.Label = ja.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_good_heanean.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_good_heanean.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_heanean.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;
    end
end

neon.SI = [backgroundSI; reliefSI]';
neon.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    neon.Label(i) = {'Background'};
end

idx = size(neon.Label,2);

for i = 1:size(reliefSI,1)
    neon.Label(idx+i) = {'Relief'};
end

neon.Label = neon.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_good_jachak.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_good_jachak.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_jachak.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;

    end
end

chuk.SI = [backgroundSI; reliefSI]';
chuk.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    chuk.Label(i) = {'Background'};
end

idx = size(chuk.Label,2);

for i = 1:size(reliefSI,1)
    chuk.Label(idx+i) = {'Relief'};
end

chuk.Label = chuk.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_good_ji.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_good_ji.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_ji.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;
    end
end

ji.SI = [backgroundSI; reliefSI]';
ji.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    ji.Label(i) = {'Background'};
end

idx = size(ji.Label,2);

for i = 1:size(reliefSI,1)
    ji.Label(idx+i) = {'Relief'};
end

ji.Label = ji.Label';

%%

reliefSI = [];
backgroundSI = [];
reliefV = [];
backgroundV = [];

V = []; VN = []; label = [];

[F, V] = stlread( 'aligned_good_kongdu.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( 'aligned_good_kongdu.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

label = load('C:\Users\Choilab\Documents\MATLAB\00_À½°¢ »õ±è 10.02\edited_labels\edited_kongdu.mat');
label = label.ReliefLabels;

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    if label(i)
        reliefSI(size(reliefSI,1)+1,:) = siData;
        reliefV(size(reliefV,2)+1) = i;
    else 
        backgroundSI(size(backgroundSI,1)+1,:) = siData;
        backgroundV(size(backgroundV,2)+1) = i;
    end
end

du.SI = [backgroundSI; reliefSI]';
du.V = [backgroundV, reliefV]';

for i = 1:size(backgroundSI,1)
    du.Label(i) = {'Background'};
end

idx = size(du.Label,2);

for i = 1:size(reliefSI,1)
    du.Label(idx+i) = {'Relief'};
end

du.Label = du.Label';