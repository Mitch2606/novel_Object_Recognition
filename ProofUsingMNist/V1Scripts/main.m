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


[returnStuff] = trainCNNNetwork(xTrain, yTrain, "preTrained", net);

net = returnStuff{1};

% [returnStuff] = askForHelp(net, todaysData);
totalNumberOfObservations = 9;

todaysData = xTrain(:,:,:,round(rand(totalNumberOfObservations,1) * size(xTrain, 4), 0) + 1);

fs = 20;
           
for index = 1: totalNumberOfObservations
    image = xTrain(:,:,:, index);
    
    imshow(image);
    
    guess = classify(net, image);

    title(guess, "fontSize", fs);
   
end















