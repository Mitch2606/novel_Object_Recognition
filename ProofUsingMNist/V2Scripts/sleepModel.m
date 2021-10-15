function [xTrain, yTrain] = sleepModel(net, xTrain, yTrain, label)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


unknownIndices = find(yTrain == label);

for index = 1 : size(unknownIndices, 1)
    guess = classify(net, xTrain(:,:,:,unknownIndices(index)));
    
    yTrain(unknownIndices(index)) = guess;
    
end


end

