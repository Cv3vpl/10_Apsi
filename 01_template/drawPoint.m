function [] = drawPoint( V,index )

for i = 1:size(index,2)
    hold on;
    plot3(V(index(1,i),1),V(index(1,i),2),10,'.', 'Color', [255, 0, 0] / 255, 'MarkerSize',12);
end

% for i = 1:size(index,2)
%     hold on;
%     plot3(V(index(2,i),1),V(index(2,i),2),10,'.', 'Color', [0, 255, 0] / 255, 'MarkerSize',12);
% end
% 
% for i = 1:size(index,2)
%     hold on;
%     plot3(V(index(3,i),1),V(index(3,i),2),10,'.', 'Color', [0, 0, 255] / 255, 'MarkerSize',12);
% end