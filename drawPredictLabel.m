function drawPredictLabel(V,label)

for i = 1:size(label,1)
    if string(label(i)) == 'Background'
        drawLabel(i) = 0;
    else
        drawLabel(i) = 1;
    end      
end
drawLabel = drawLabel';

figure, drawscatter( V, labelVertex2rgb(drawLabel) )