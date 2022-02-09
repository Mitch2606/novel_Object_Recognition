image = ones([1000 1000 3]);

imagesc(image)

for i = 1: 5
    [x, y] = ginput(2);

    point1 = [int16(x(1)),int16(y(1))];
    point2 = [int16(x(2)),int16(y(2))];
    thickness = 1;

    [imageWithSquare] = drawSquare(image, point1, point2,...
        "showImage", 1, "thickness", thickness);

end