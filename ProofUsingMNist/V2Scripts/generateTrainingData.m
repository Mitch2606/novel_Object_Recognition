function [xTrain, yTrain] = generateTrainingData(trainingLabels)
load('masterDataset.mat')

%Setup Input Images
knownNumbers = [];
for i = 1: size(trainingLabels, 2) - 1
    knownNumbers = [knownNumbers, wordToNumber(trainingLabels(i))];
end

total = 1000;

%Get Known Stimulus
tempX = [];
tempY = [];
for xIndex = 1: size(trainingLabels, 2)
    
    currentLabel = trainingLabels(xIndex);
    if(currentLabel ~= "unknown")
        tempX = cat(3, tempX, masterDataset{wordToNumber(currentLabel) + 1}(:,:,1:total));
    else
        %Pick a random Unknown Number
        for i = 1: 5
            randomNumber = round(rand(1,1) * 9, 0) + 1;
            while(ismember(randomNumber, knownNumbers) == 1)
                randomNumber = round(rand(1,1) * 9, 0) + 1;
            end
            
            tempX = cat(3, tempX, masterDataset{randomNumber}(:,:,1:(total / 5)));
        end
    end
    
    for yIndex = 1: total
        tempY = [tempY; currentLabel];
    end
end

xTrain = reshape(tempX, size(tempX,1),size(tempX,2),1,size(tempX,3));
yTrain = categorical(tempY);



