function i = findVertex( V, P )
% i = findVertex( V, P )
% 
% find an index for P in V

i = intersect( find( V(:,1) == P(1) ), find( V(:,2) == P(2) ) );
if isempty(i)
    return;
end

i = intersect( i, find( V(:,3) == P(3)) );
