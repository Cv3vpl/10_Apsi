[F, V, FN] = stlread('aligned_average_nomja.stl'); % F:face, V:vertics, N:Face normal

[F, V] = uniqueFV( F, V ); % 중복성분 제거
VN = STLVertexNormals(F, V); % Vertex normal을 구하는 함수
nV = size(V,1); % mesh파일을 이루는 꼭지점의 개수

% Gaussian smoothing
% average edge length -> avgedgelen
E = uniqueEfromF(F);


ngbrsigma = 2.5;
sVN = gauss3dsmoothing( V, VN, ngbrsigma * 1.2, 1.2 );%sigma값을 1.2로 해서 구한 함수

L = sqrt(sum((V(E(:,1), :) - V(E(:,2), :)).^2, 2));
len = sum(L)/(length(E));

% Structure for curvature function
FV.faces = F;
FV.vertices = V;