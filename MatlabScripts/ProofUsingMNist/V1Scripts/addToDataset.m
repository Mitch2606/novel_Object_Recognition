function [xTrain, yTrain] = addToDataset(imageData, xTrain, yTrain, newLabel)
%GETTRAININGDATA Summary of this function goes here
%   Detailed explanation goes here

%FormatImage
imageData = reshape(imageData, size(imageData,1),size(imageData,2),1,size(imageData,3));

%Concatinate
xTrain = cat(4, xTrain, imageData);
yTrain = [yTrain; {newLabel}];
end

