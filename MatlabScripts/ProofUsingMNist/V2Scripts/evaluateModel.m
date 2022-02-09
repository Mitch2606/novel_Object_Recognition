function [optionalReturns] = evaluateModel(net)
%EVALUATEMODEL Summary of this function goes here
%   Detailed explanation goes here

load('masterDataset.mat')

fs = 30;
accuracy = 0;

figure
for index = 1: 9
    subplot(3,3,index)
    
    randomImage = masterDataset{index}(:,:, end - (round(rand(1,1) * 9, 0) + 1));
    
    imshow(randomImage);
    
    randomImage = reshape(randomImage, size(randomImage, 1), size(randomImage,2), 1, size(randomImage, 3));
    
    guess = classify(net, randomImage);
    real = numberToWord(index - 1);
    
    title(string(real) + " | " + string(guess), "fontSize", fs);
    
end

optionalReturns = [{accuracy}];

end

