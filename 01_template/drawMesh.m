function [] = drawMesh(fileName) 

fv  =  stlread(fileName);
figure, patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
'EdgeColor',       'none',        ...
'FaceLighting',    'gouraud',     ...
'AmbientStrength', 0.15);
view([90,90]);
axis image
camlight();
lighting phong;

daspect([1 1 0.2])

clear fv;