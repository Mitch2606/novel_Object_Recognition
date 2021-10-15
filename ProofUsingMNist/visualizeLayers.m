function visualizeLayers(net, layerNumber, channels)
%VISUALIZELAYERS Summary of this function goes here
%   Detailed explanation goes here


layer = layerNumber;
name = net.Layers(layer).Name;

I = deepDreamImage(net,name,channels, ...
    'PyramidLevels',1);

figure
I = imtile(I,'ThumbnailSize',[64 64]);
imshow(I)
title(['Layer ',name,' Features'],'Interpreter','none')

end

