function [xTrain, yTrain, trainingLabels] = newStimulus(trainingLabels, xTrain, yTrain)
%NEWSTIMULUS Summary of this function goes here
%   Detailed explanation goes here

load('masterDataset.mat')

% knownNumbers = [];
% for i = 1: size(trainingLabels, 2)
%     if(lower(trainingLabels(i)) == "unknown")
%         continue;
%     end
%     knownNumbers = [knownNumbers, wordToNumber(trainingLabels(i))];
% end

%Get Known Stimulus
tempX = [];
tempY = [];
% figure
for i = 1: 1
    randomNumber = round(rand(1,1) * 8, 0) + 1;
%     while(ismember(randomNumber, knownNumbers) == 1)
%         randomNumber = round(rand(1,1) * 8, 0) + 1;
%     end
    
    currentLabel = lower(numberToWord(randomNumber - 1));
    randomIndices = unique(round(rand(1000, 1) * 999, 0) + 1);
    
    tempX = cat(3, tempX, masterDataset{randomNumber}(:,:,randomIndices));

    for yIndex = 1: size(randomIndices, 1)
        tempY = [tempY; currentLabel];
    end
end

% imshow(tempX(:,:,end))
% title(currentLabel)

tempX = reshape(tempX, size(tempX,1),size(tempX,2),1,size(tempX,3));
tempY = cellstr(tempY);

xTrain = cat(4, xTrain, tempX);
yTrain = [yTrain; categorical(tempY)];

trainingLabels = transpose(string(unique(yTrain)));

end

