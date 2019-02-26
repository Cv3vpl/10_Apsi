function res = simMeasureSITemplate( V, templ, params, meafunc , pd)
% res = simMeasureSITemplate( V, templ, params, meafunc )
%
% SI similarity measures of all the vertices in V with respect to the templates 
% using a similarity measure function (meafunc)
%
% templ: SI templates
% params: SI parameters
% meafunc: SI similairty measure function

nV = size(V,1);
nClass = size(templ,3)/4; %Ŭ���� ���� ����

res = zeros(nV,nClass);

for i = 1:nV
    apsi_cur = APSI(V(i,:), params.bintv, params.nb, params.aintv, params.na, pd);
    apsi_cur = apsi_cur ./ sum(apsi_cur(:));
    for c = 1:nClass
        res(i,c) = meafunc(apsi_cur, templ(:,:,(c*4-3):c*4)); % ���ø� ���Ұ��� ����
    end
end
