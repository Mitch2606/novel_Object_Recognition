function [xTrain, yTrain] = getTrainingData()
%GETTRAININGDATA Summary of this function goes here
%   Detailed explanation goes here
%Load Master Dataset
load('ProofUsingMNist\Scripts\masterDataset.mat')

%Numbers to use initially
trainingLabels = ["Zero","One","Two", "Unknown"];

labels = categorical(trainingLabels);

%Setup Input Images

tempX = [];
tempY = [];
for xIndex = 1: size(trainingLabels, 2)
    tempX = cat(3, tempX, masterDataset{xIndex}(:,:,1:5000));
    
    for yIndex = 1: 5000
        tempY = [tempY; trainingLabels(xIndex)];
    end
end

xTrain = reshape(tempX, size(tempX,1),size(tempX,2),1,size(tempX,3));
yTrain = categorical(tempY);
end

