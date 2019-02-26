function [ sVN ] = gauss3dsmoothing( V, VN, halflen, sigma )

cube = [V-halflen, V+halflen];

sVN = zeros(size(VN));
for ii = 1:length(V)
    candidateV = (V(:, 1) > cube(ii, 1)) & (V(:, 1) < cube(ii, 4)) & ...
                 (V(:, 2) > cube(ii, 2)) & (V(:, 2) < cube(ii, 5)) & ...
                 (V(:, 3) > cube(ii, 3)) & (V(:, 3) < cube(ii, 6));
    
    nv = sum(candidateV);
    V1 = V(candidateV, :);
    V2 = repmat(V(ii, :), nv, 1);
    dist2 = sum((V1-V2).^2, 2);
    w = exp(-(dist2 ./ (sigma^2 * 2))); % weight
    w = w / sum(w); % normalized
    
    N1 = VN(candidateV, :);
    w = repmat(w, 1, 3);
    sVN(ii, :) = sum(N1.*w);
end