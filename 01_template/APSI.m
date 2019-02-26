function res2 = APSI(p, bintv, nb, aintv, na, pd)    
% V: vertices
% VN: vertex normals
% p: center position
% bintv: interval of beta
% nb = # of bins in beta (positive nb & negative nb)
% aintv: interval of alpha
% na = # of bins in alpha

global V  VN

k = findVertex( V, p ); %p점의 vertex index확인
n = VN(k,:); %p점의 기준 normal 찾기

% max distance
r = sqrt( nb*nb*bintv*bintv + na*na*aintv*aintv );

% find vertices within ROI 
pm = [p - r; p + r];
vidx = pm(1,1) <= V(:,1) & V(:,1) <= pm(2,1) & ...
       pm(1,2) <= V(:,2) & V(:,2) <= pm(2,2) & ...
       pm(1,3) <= V(:,3) & V(:,3) <= pm(2,3);

vidx(k) = false; %기준점 제거
V1 = V(vidx,:); %기준점을 뺀 ROI의 점들
nV = size(V1, 1); %기준점을 뺀 ROI의 점들 갯수

%현재 기준점인 P점으로 기준점 맞추기
V0 = V1 - repmat(p, nV, 1);

%수식적용
beta = V0 * n';

betan = beta * n;
projQ = V0 - betan; % 범위 내의 점을 projection
alpha = sqrt(sum((projQ).^2, 2));

alphaidx = ceil(alpha ./ aintv);
betaidx = ceil(beta ./ bintv) + nb;

idx = alphaidx <= na & 1 <= betaidx & betaidx <= 2*nb; %원통안에 있는지 확인

alphaidx = alphaidx(idx);% 저장
betaidx = betaidx(idx);%저장

projC = pd(k, :) - dot(n, pd(k, :))*n;
nprojC = projC / norm(projC);
theta = acos((projQ * nprojC')./vecnorm(projQ, 2, 2));
theta_d = cross(projQ, repmat(nprojC, length(projQ), 1));

theta = theta(idx); theta_d = theta_d(idx, :);
bool360 = theta_d(:, 3)<0;
booltd = (theta_d(:, 3)>0) - (theta_d(:, 3)<0);
theta = theta.*booltd + bool360*deg2rad(360);

%result 선언
res = zeros( 2*nb, na, 4 );
res2 = zeros( 2*nb, na, 4 );

%res저장
for i = 1:length(alphaidx)
    %각도 따라 분리
    if deg2rad(45) <= theta(i) && theta(i) < deg2rad(135)
        res( betaidx(i), alphaidx(i), 1 ) = res( betaidx(i), alphaidx(i) ) + 1;
    elseif deg2rad(135) <= theta(i) && theta(i) < deg2rad(225)
        res( betaidx(i), alphaidx(i), 2 ) = res( betaidx(i), alphaidx(i) ) + 1;
    elseif deg2rad(225) <= theta(i) && theta(i) < deg2rad(315)
        res( betaidx(i), alphaidx(i), 3 ) = res( betaidx(i), alphaidx(i) ) + 1;
    elseif (deg2rad(315) <= theta(i) && theta(i) < deg2rad(360)) || (deg2rad(0) <= theta(i) && theta(i) < deg2rad(45))
        res( betaidx(i), alphaidx(i), 4 ) = res( betaidx(i), alphaidx(i) ) + 1;
    end
end

for i = 1:length(alphaidx) % 면적으로 나눈 벡터
    res2(betaidx(i), alphaidx(i), 1) = res(betaidx(i), alphaidx(i), 1) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
    res2(betaidx(i), alphaidx(i), 2) = res(betaidx(i), alphaidx(i), 2) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
    res2(betaidx(i), alphaidx(i), 3) = res(betaidx(i), alphaidx(i), 3) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
    res2(betaidx(i), alphaidx(i), 4) = res(betaidx(i), alphaidx(i), 4) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
end