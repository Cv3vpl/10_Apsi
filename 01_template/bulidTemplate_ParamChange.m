function Templs = bulidTemplate_ParamChange(params)
global fns
%%
fns = {'aligned_good_ji.stl', 'aligned_average_jak.stl', 'aligned_poor_li.stl','aligned_good_ajjine.stl','aligned_good_jachak.stl','aligned_good_kongdu.stl','aligned_average_doeubdo.stl',...
        'aligned_average_jiabibu.stl','aligned_average_nomja.stl','aligned_good_heanean.stl','aligned_average_gaesuel.stl','aligned_poor_changanmu.stl','aligned_poor_dahalga.stl','aligned_poor_gonggong.stl',...
        'aligned_poor_nomja.stl','aligned_poor_samsu.stl'};

% the 1st row: relief indices
% the 2nd row: relief boundary indices
% the 3rd row: background indices
         
ji_refIdx = [16175,22862,19127,30372,10706,17078,23319,5039,33722,23388,3607,26168,673,23752,33570,5807,14934,6462,6430,10458;...
             29423,6745,5990,1141,23176,16945,30493,25403,34181,19238,36618,4077,4990,33070,25084,30408,30408,18889,26015,5888;...
             5413,20329,13682,6698,32449,21976,9060,35188,8576,11924,8732,30852,806,21436,13863,5386,7474,32881,21914,12322];
         
jak_refIdx = [19013,22601,38129,22444,27067,20558,10742,18853,40264,25993,2103,41323,8389,10423,10283,5188,9777,21296,23875,41689;...
              22507,26457,26735,30104,18965,38062,29113,43578,11006,8646,41724,23197,39273,20522,17782,24526,21315,10393,32030,40516;...
              13664,32561,3668,13806,35859,24472,31944,38862,36705,34641,43318,38680,13648,20173,7161,10641,37692,34629,15482,36444];
          
ajjine_refIdx = [4892,28699,21968,28520,33094,31373,21153,15822,25794,28537,2125,23233,11740,11675,11535,4933,1565,14338,10243,35473;...
                42433,38225,24316,32220,40690,32152,18088,27253,18065,32277,41261,22457,11910,28497,26811,23313,30701,31931,10970,38357;...
                42742,33569,18334,33609,30126,18422,10296,37806,3790,15552,30779,36931,29987,16812,13911,17090,39185,10140,13146,28967];
                        
jachak_refIdx = [15164,29304,16339,28759,26202,12958,12482,3237,5262,11784,4495,22277,7177,13021,23822;...
                2403,19453,3892,28654,14844,4391,13817,14494,4585,11586,4601,4601,4601,10335,2798;...
                6694,10895,15566,17750,14529,23717,23239,17302,1999,28906,4041,11787,5552,20738,25984];

kongdu_refIdx = [13707,24351,1909,11592,11377,2175,10574,23296,9737,9362,174,15522,7402,16797,16558;...
                13220,14100,9794,1055,1095,11958,10145,168,7279,6930,24837,16676,8881,2975,1275;...
                21896,21507,404,16966,21691,10746,21930,11110,15073,9087,23521,13519,2883,14446,16577];

doeubdo_refIdx = [48854,26459,47135,39351,38337,54792,29635,56206,9117,15965,37994,16840,44140,29483,21189,28613,39168,6154,29310,23555;...
                  3419,1907,1474,704,5548,28486,25224,51123,15964,25565,54410,19699,1131,28356,10229,50090,7273,44767,1604,54249;...
                  53708,30694,11710,50944,40655,6889,46795,402,28580,28580,55653,29559,42920,53653,10021,30763,10005,39691,56548,27535];

jiabibu_refIdx = [19883,14881,20675,17370,10855,28942,29893,30686,16304,19987,21148,30077,21851,15583,4768;...
                  7358,28443,239,27599,13096,19696,31727,19925,15441,14440,32285,30585,5392,16330,31938;...
                  27852,15211,19502,28678,13371,30110,26452,22856,6904,63,18673,17182,30850,5416,17323];
              
nomja_refIdx = [24489,41472,24335,431,38897,38318,14195,25808,40816,39729,19232,26131,15046,42583,48500;...
                25277,55069,33961,47570,34376,28168,10430,10901,22066,23672,52911,10896,46898,5496,42310;...
                32328,29,49452,22630,16040,14396,38584,41759,52752,295,19898,12228,20404,53362,37770];

heanean_refIdx = [21942,4448,4457,60809,63172,28300,35187,61297,59719,16355,11042,26866,8037,39825,40094;...
                  31819,36164,19912,36892,19597,37593,40207,16871,35564,17869,53763,5333,3217,40067,7476;...
                  7572,42422,46266,66875,47143,38295,59884,61215,49304,25458,19492,40955,57431,4190,39966];
              
% template information for relief
TI_relief = { };

templInfo.modelfn = fns{1};
templInfo.vtxidx = ji_refIdx(1,:);
TI_relief{1} = templInfo;

templInfo.modelfn = fns{2};
templInfo.vtxidx = jak_refIdx(1,:);
TI_relief{2} = templInfo;

%li글자의 relief index가 없음

templInfo.modelfn = fns{4};
templInfo.vtxidx = ajjine_refIdx(1,:);
TI_relief{3} = templInfo;

templInfo.modelfn = fns{5};
templInfo.vtxidx = jachak_refIdx(1,:);
TI_relief{4} = templInfo;

templInfo.modelfn = fns{6};
templInfo.vtxidx = kongdu_refIdx(1,:);
TI_relief{5} = templInfo;

% templInfo.modelfn = fns{7};
% templInfo.vtxidx = doeubdo_refIdx(1,:);
% TI_relief{6} = templInfo;
% 
% templInfo.modelfn = fns{8};
% templInfo.vtxidx = jiabibu_refIdx(1,:);
% TI_relief{7} = templInfo;
% 
% templInfo.modelfn = fns{9};
% templInfo.vtxidx = nomja_refIdx(1,:);
% TI_relief{8} = templInfo;
% 
% templInfo.modelfn = fns{10};
% templInfo.vtxidx = heanean_refIdx(1,:);
% TI_relief{9} = templInfo;

% template information for relief boundary
TI_reliefboundary = { };

templInfo.modelfn = fns{1};
templInfo.vtxidx = ji_refIdx(2,:);
TI_reliefboundary{1} = templInfo;

templInfo.modelfn = fns{2};
templInfo.vtxidx = jak_refIdx(2,:);
TI_reliefboundary{2} = templInfo;

templInfo.modelfn = fns{4};
templInfo.vtxidx = ajjine_refIdx(2,:);
TI_reliefboundary{3} = templInfo;

templInfo.modelfn = fns{5};
templInfo.vtxidx = jachak_refIdx(2,:);
TI_reliefboundary{4} = templInfo;

templInfo.modelfn = fns{6};
templInfo.vtxidx = kongdu_refIdx(2,:);
TI_reliefboundary{5} = templInfo;

% templInfo.modelfn = fns{7};
% templInfo.vtxidx = doeubdo_refIdx(2,:);
% TI_reliefboundary{6} = templInfo;
% 
% templInfo.modelfn = fns{8};
% templInfo.vtxidx = jiabibu_refIdx(2,:);
% TI_reliefboundary{7} = templInfo;
% 
% templInfo.modelfn = fns{9};
% templInfo.vtxidx = nomja_refIdx(2,:);
% TI_reliefboundary{8} = templInfo;
% 
% templInfo.modelfn = fns{10};
% templInfo.vtxidx = heanean_refIdx(2,:);
% TI_reliefboundary{9} = templInfo;

% template information for background
TI_background = { };

templInfo.modelfn = fns{1};
templInfo.vtxidx = ji_refIdx(3,:);
TI_background{1} = templInfo;

templInfo.modelfn = fns{2};
templInfo.vtxidx = jak_refIdx(3,:);
TI_background{2} = templInfo;

templInfo.modelfn = fns{4};
templInfo.vtxidx = ajjine_refIdx(3,:);
TI_background{3} = templInfo;

templInfo.modelfn = fns{5};
templInfo.vtxidx = jachak_refIdx(3,:);
TI_background{4} = templInfo;

templInfo.modelfn = fns{6};
templInfo.vtxidx = kongdu_refIdx(3,:);
TI_background{5} = templInfo;

% templInfo.modelfn = fns{7};
% templInfo.vtxidx = doeubdo_refIdx(3,:);
% TI_background{6} = templInfo;
% 
% templInfo.modelfn = fns{8};
% templInfo.vtxidx = jiabibu_refIdx(3,:);
% TI_background{7} = templInfo;
% 
% templInfo.modelfn = fns{9};
% templInfo.vtxidx = nomja_refIdx(3,:);
% TI_background{8} = templInfo;
% 
% templInfo.modelfn = fns{10};
% templInfo.vtxidx = heanean_refIdx(3,:);
% TI_background{9} = templInfo;

%%
LVP = makeSITemplate( TI_relief, params );
ALVP = makeSITemplate( TI_reliefboundary, params );
BGVP = makeSITemplate( TI_background, params );
Templs.params = params;
Templs.T = cat(3, LVP, ALVP, BGVP);
clear LVP ALVP BGVP ji_refIdx jak_refIdx TI_relief TI_reliefboundary TI_background templInfo params meas species
%%
% figure;
% subplot(131), imagesc(Templs.T(:,:,1)), axis image, axis xy, xlabel('\alpha'), ylabel('\beta'), title('Relief');
% subplot(132), imagesc(Templs.T(:,:,2)), axis image, axis xy, xlabel('\alpha'), ylabel('\beta'), title('Around Relief');
% subplot(133), imagesc(Templs.T(:,:,3)), axis image, axis xy, xlabel('\alpha'), ylabel('\beta'), title('Background');