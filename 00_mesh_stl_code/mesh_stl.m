[F, V, FN] = stlread('aligned_average_nomja.stl'); % F:face, V:vertics, N:Face normal

[F, V] = uniqueFV( F, V ); % �ߺ����� ����
VN = STLVertexNormals(F, V); % Vertex normal�� ���ϴ� �Լ�
nV = size(V,1); % mesh������ �̷�� �������� ����

% Gaussian smoothing
% average edge length -> avgedgelen
E = uniqueEfromF(F);


ngbrsigma = 2.5;
sVN = gauss3dsmoothing( V, VN, ngbrsigma * 1.2, 1.2 );%sigma���� 1.2�� �ؼ� ���� �Լ�

L = sqrt(sum((V(E(:,1), :) - V(E(:,2), :)).^2, 2));
len = sum(L)/(length(E));

% Structure for curvature function
FV.faces = F;
FV.vertices = V;