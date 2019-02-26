function res2 = APSI(p, bintv, nb, aintv, na, pd)    
% V: vertices
% VN: vertex normals
% p: center position
% bintv: interval of beta
% nb = # of bins in beta (positive nb & negative nb)
% aintv: interval of alpha
% na = # of bins in alpha

global V  VN

k = findVertex( V, p ); %p���� vertex indexȮ��
n = VN(k,:); %p���� ���� normal ã��

% max distance
r = sqrt( nb*nb*bintv*bintv + na*na*aintv*aintv );

% find vertices within ROI 
pm = [p - r; p + r];
vidx = pm(1,1) <= V(:,1) & V(:,1) <= pm(2,1) & ...
       pm(1,2) <= V(:,2) & V(:,2) <= pm(2,2) & ...
       pm(1,3) <= V(:,3) & V(:,3) <= pm(2,3);

vidx(k) = false; %������ ����
V1 = V(vidx,:); %�������� �� ROI�� ����
nV = size(V1, 1); %�������� �� ROI�� ���� ����

%���� �������� P������ ������ ���߱�
V0 = V1 - repmat(p, nV, 1);

%��������
beta = V0 * n';

betan = beta * n;
projQ = V0 - betan; % ���� ���� ���� projection
alpha = sqrt(sum((projQ).^2, 2));

alphaidx = ceil(alpha ./ aintv);
betaidx = ceil(beta ./ bintv) + nb;

idx = alphaidx <= na & 1 <= betaidx & betaidx <= 2*nb; %����ȿ� �ִ��� Ȯ��

alphaidx = alphaidx(idx);% ����
betaidx = betaidx(idx);%����

projC = pd(k, :) - dot(n, pd(k, :))*n;
nprojC = projC / norm(projC);
theta = acos((projQ * nprojC')./vecnorm(projQ, 2, 2));
theta_d = cross(projQ, repmat(nprojC, length(projQ), 1));

theta = theta(idx); theta_d = theta_d(idx, :);
bool360 = theta_d(:, 3)<0;
booltd = (theta_d(:, 3)>0) - (theta_d(:, 3)<0);
theta = theta.*booltd + bool360*deg2rad(360);

%result ����
res = zeros( 2*nb, na, 4 );
res2 = zeros( 2*nb, na, 4 );

%res����
for i = 1:length(alphaidx)
    %���� ���� �и�
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

for i = 1:length(alphaidx) % �������� ���� ����
    res2(betaidx(i), alphaidx(i), 1) = res(betaidx(i), alphaidx(i), 1) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
    res2(betaidx(i), alphaidx(i), 2) = res(betaidx(i), alphaidx(i), 2) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
    res2(betaidx(i), alphaidx(i), 3) = res(betaidx(i), alphaidx(i), 3) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
    res2(betaidx(i), alphaidx(i), 4) = res(betaidx(i), alphaidx(i), 4) / (pi*(alphaidx(i).^2 - (alphaidx(i)-1).^2));
end