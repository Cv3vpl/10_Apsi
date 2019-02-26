function [faces, vertices] = uniqueFV( F, V )

[vertices, ~, iC] = unique( V, 'rows', 'stable' );
faces = reshape( iC, fliplr(size(F)) )';