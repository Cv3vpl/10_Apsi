function result = NLC(S,T, weights)
% result = NLC(S,T) 
% normalized linear correlation
    N = numel(S);
    s = S(:);
    t = T(:);
    ss = sum(s);
    st = sum(t);
    nom = N * s' * t - ss * st;
    denominator = sqrt( (N*sum(s .^ 2) - ss^2) * (N*sum(t .^ 2) - st^2) );
    result = nom / denominator;
end