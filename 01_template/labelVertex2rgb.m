function rgb = labelVertex2rgb( labels )
% rgb = labelVertex2rgb( labels )

rgb = double(squeeze(label2rgb( labels, 'jet', ones(1,3)*0.3, 'shuffle' ))) / 255;