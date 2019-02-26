
%% ����
fid = fopen('jidata.dat', 'w');
fwrite( fid, ji.SI, 'double');
fclose(fid)
Y2 = grp2idx(ji.Label);
fid = fopen('jilabel.dat', 'w');
fwrite( fid, Y2, 'double');
fclose(fid)

%% dat���� �б�
fid = fopen('small_ji_1.dat', 'r');
r = fread(fid, 'double');
fclose(fid);
r(1:19) = [];

%% ����
fid = fopen('data1.dat', 'w');
fwrite( fid, LVP, 'double');
fclose(fid)

%% ���� ���� APSI ���
find(V(:, 1)==cursor_info.Position(1));
figure, quiver(0, 0, pd(ans, 1), pd(ans, 2)); axis([-1 1 -1 1]);
templInfo.modelfn = fns{6};
templInfo.vtxidx = ans;
TI_relief{1} = templInfo;
LVP = makeSITemplate( TI_relief, params );
figure;
subplot(141), imagesc(LVP(:,:,1)), axis image, axis xy, xlabel('\alpha'), ylabel('\beta'), title('Relief');
subplot(142), imagesc(LVP(:,:,2)), axis image, axis xy, xlabel('\alpha'), ylabel('\beta'), title('Relief');
subplot(143), imagesc(LVP(:,:,3)), axis image, axis xy, xlabel('\alpha'), ylabel('\beta'), title('Relief');
subplot(144), imagesc(LVP(:,:,4)), axis image, axis xy, xlabel('\alpha'), ylabel('\beta'), title('Relief');

%% �� �������� APSI - label�� ���� �����Ϳ� ���� APSI ����� ���

global V VN

params.aintv = 0.6; % mm unit 0.6
params.bintv = 0.4; % mm unit 0.4
params.na = 10; % 10
params.nb = 4; % 4 �� ���ݱ��� ���� �߳���

SVMData.SI = [];
SVMData.V = [];

[F, V] = stlread( '�̷ο︮_0623.stl' );
[F, V] = uniqueFV( F, V );
VN = getGSVN( '�̷ο︮_0623.stl' );

FV.faces = F;
FV.vertices = V;
[pd, ~, ~, ~] =  GetCurvatures( FV ,1 );

for i = 1:size(V,1)
    if ~isInnerPoint(V(i,:))
        continue;
    end
    siData = APSI( V(i,:), params.bintv, params.nb, params.aintv, params.na, pd );
    siData = siData(:)';
    
    SVMData.SI(size(SVMData.SI,1)+1,:) = siData;
    SVMData.V(size(SVMData.V,2)+1) = i;
end

SVMData.SI = SVMData.SI';