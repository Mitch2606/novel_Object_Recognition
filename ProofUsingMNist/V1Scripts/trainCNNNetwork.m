function [optionalReturnArguments] = trainCNNNetwork(xTrain, yTrain, varargin)
%TRAINCNNNETWORK Summary of this function goes here
%   Detailed explanation goes here

netDir = "trainedNets\";

fs = 20;
train = 1;
numKnownLabels = size(unique(yTrain), 1) - 1;
showGraph = 0;

for i = 1:2: size(varargin, 2)
    varName = lower(varargin{i});
    varValue = varargin{i + 1};
    switch(varName)
        case("pretrained")
            net = varValue;
            train = 0;
        case("continuetrain")
            net = varValue;
            train = 2;
        case("numknownlabels")
            numKnownLabels = varValue;
        case("showgraph")
            showGraph = varValue;
        otherwise
            disp("Invalid Argument detected: " + varValue);
    end
end

%Setup Network Stuff
layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(numKnownLabels + 1)%Plus One for the Unknown Label
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    'ValidationFrequency',30, ...
    'Verbose',true);

%Train Network
if (train == 1)
    fileName = "network" + numKnownLabels + ".mat";
    net = trainNetwork(xTrain, yTrain, layers, options);
    save(netDir + fileName, 'net')
elseif(train == 2)
    fileName = "network.mat";
    net = trainNetwork(xTrain, yTrain, layers(net), options);
    save(netDir + fileName, 'net')
end

optionalReturnArguments = [{net}];

if(showGraph == 0)
    return
end

figure
for i = 1: 9
    subplot(3,3,i)
    index = round(rand(1,1) * size(xTrain, 4), 0) + 1;
    randomImage = xTrain(:,:,:, index);

    imshow(randomImage);
    
    guess = classify(net, randomImage);
    real = yTrain(index);
    
    title(string(real) + " | " + string(guess), "fontSize", fs);
    
end



end

