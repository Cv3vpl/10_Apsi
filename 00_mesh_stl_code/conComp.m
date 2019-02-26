function grps = conComp( E, blobflag )

grES = sum(blobflag(E), 2);
idx = (grES == 2);

grps = findconnectedgroup(E(idx, :));
end

function grps = findconnectedgroup( E )
    grps = {};
    while size(E,1) > 0
        curv = E(1,1);
        grp = curv;
        
        v2search = curv;
        while ~isempty(v2search)
            [rows, ~] = find(E == v2search(1));
            v2search(1) = [];
            
            E1 = E(rows,:);
            E(rows,:) = [];
            v2search = union(v2search, setdiff( E1(:), grp ));
            grp = union( grp, v2search );
        end
        ngrps = numel(grps);
        grps{ngrps+1} = grp;
    end
end
