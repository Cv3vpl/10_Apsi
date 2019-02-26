function res = SI(p, bintv, nb, aintv, na)    
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
alpha = sqrt(sum((V0 - betan).^2, 2));

alphaidx = ceil(alpha ./ aintv);
betaidx = ceil(beta ./ bintv) + nb;

idx = alphaidx <= na & 1 <= betaidx & betaidx <= 2*nb;%원통안에 있는지 확인

%각도 따라 분리
alphaidx = alphaidx(idx);% 저장
betaidx = betaidx(idx);%저장
%

%result 선언
res = zeros( 2*nb, na );

%res저장
for i = 1:length(alphaidx)
    res( betaidx(i), alphaidx(i) ) = res( betaidx(i), alphaidx(i) ) + 1;
    %res 4개
end