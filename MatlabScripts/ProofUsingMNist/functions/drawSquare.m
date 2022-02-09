function [imageWithSquare] = drawSquare(image, point1, point2, varargin)
%DRAWSQUARE Summary of this function goes here
%   Detailed explanation goes here

thickness = 1;
colorChannels = [2:3];
showImage = 0;
for index = 1:2:length(varargin)
    parm = lower(varargin{index});
    value = varargin{index + 1};
    switch(parm)
        case("showimage")
            showImage = value;
        case("thickness")
            thickness = value;
        case("color")
            colorChannels = value;
        otherwise
            fprintf("Error in drawSquare: Parameter doesn't exist: " + parm);
    end

end

if(point1(1) < point2(1))
    stepX = 1;
else
    stepX = -1;
end

if(point1(2) < point2(2))
    stepY = 1;
else
    stepY = -1;
end


%Default thickness is 1, so the thickness value needs to be adjusted:
thickness = thickness - 1;

%image(Y, X, ColorChannel)
image(point1(2):stepY:point2(2), point1(1):stepX:(point1(1) + stepX * thickness), colorChannels) = 0;
image(point1(2):stepY:point2(2), point2(1):stepX:(point2(1) + stepX * thickness), colorChannels) = 0;

image(point2(2):stepY:(point2(2) + stepY * thickness), point1(1):stepX:(point2(1) + stepX * thickness), colorChannels) = 0;
image(point1(2):stepY:(point1(2) + stepY * thickness), point1(1):stepX:point2(1), colorChannels) = 0;

%Get Return value
imageWithSquare = image;

%Show Image
if(~showImage)
    return;
end

imagesc(image)

end

