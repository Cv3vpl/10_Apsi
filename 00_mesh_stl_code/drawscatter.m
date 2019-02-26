function drawscatter( P, RGBcolor )
% drawscatter( P, RGBcolor )

hold on
scatter3(P(:, 1), P(:, 2), P(:, 3), 5, RGBcolor);
view([90 90]);
hold off

end

