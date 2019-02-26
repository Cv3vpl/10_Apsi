function lv = localVarianceN( V, VN, halflen )
% �� vertex ������ ������� halflen�� ���̸� ������ ť�� �ȿ� ���� ��� vertex ���Ϳ��� ����þȽ�����
% ť�� ����(�Ʒ��� ������ ������ ������ü ���� �����ϴ� vertex�� ã��)

cube = [V-halflen, V+halflen];

nV = size(V,1);
lv = zeros( nV, 1 );
for ii = 1:nV
    candidateV = (V(:, 1) > cube(ii, 1)) & (V(:, 1) < cube(ii, 4)) & ...
                 (V(:, 2) > cube(ii, 2)) & (V(:, 2) < cube(ii, 5)) & ...
                 (V(:, 3) > cube(ii, 3)) & (V(:, 3) < cube(ii, 6));
    
    nv = sum(candidateV);
    VN1 = VN(candidateV, :);
    mn = mean(VN1);
    
    VN2 = repmat(mn, nv, 1);
    lv(ii) = mean(sum((VN1-VN2).^2, 2));
end