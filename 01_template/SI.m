function res = SI(p, bintv, nb, aintv, na)    
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
alpha = sqrt(sum((V0 - betan).^2, 2));

alphaidx = ceil(alpha ./ aintv);
betaidx = ceil(beta ./ bintv) + nb;

idx = alphaidx <= na & 1 <= betaidx & betaidx <= 2*nb;%����ȿ� �ִ��� Ȯ��

%���� ���� �и�
alphaidx = alphaidx(idx);% ����
betaidx = betaidx(idx);%����
%

%result ����
res = zeros( 2*nb, na );

%res����
for i = 1:length(alphaidx)
    res( betaidx(i), alphaidx(i) ) = res( betaidx(i), alphaidx(i) ) + 1;
    %res 4��
end