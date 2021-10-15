function [optionalReturns] = evaluate(net)
%EVALUATE Summary of this function goes here
%   Detailed explanation goes here
load('ProofUsingMNist\Scripts\masterDataset.mat')

fs = 30;

figure
for index = 1: 9
    subplot(3,3,index)
    
    randomImage = masterDataset{index}(:,:, round(rand(1,1) * 9, 0) + 1);
    
    imshow(randomImage);
    
    randomImage = reshape(randomImage, size(randomImage, 1), size(randomImage,2), 1, size(randomImage, 3));
    
    guess = classify(net, randomImage);
    real = numberToWord(index - 1);
    
    title(string(real) + " | " + string(guess), "fontSize", fs);
    
end
    

end

