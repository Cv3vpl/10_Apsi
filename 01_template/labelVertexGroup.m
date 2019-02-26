function labels = labelVertexGroup( vgroup, vimax )

if nargin == 1
    for gi = 1:numel(vgroup)
        vimax = max( [vgroup{gi}; vimax] );    
    end
end

labels = zeros(vimax,1);

for gi = 1:numel(vgroup)
    labels( vgroup{gi} ) = gi;
end