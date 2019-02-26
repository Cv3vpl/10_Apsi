function E = uniqueEfromF(F)

E = [ F(:, [1 2]); F(:, [2 3]); F(:, [1 3]) ];
boolE = E(:, 1) > E(:, 2);
E(boolE, :) = E(boolE, [2 1]);
E = unique(E, 'rows');
