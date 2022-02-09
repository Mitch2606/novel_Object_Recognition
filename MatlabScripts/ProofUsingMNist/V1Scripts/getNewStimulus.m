function [newImageData, networkGuess, actualLabel] = getNewStimulus(net, knownLabels)
%GETNEWSTIMULUS Summary of this function goes here
%   Detailed explanation goes here

load("Scripts/masterDataset");

% knownNumbers = [];
% for index = 1: size(knownLabels, 2)
%     knownNumbers = [knownNumbers, wordToNumber(knownLabels(index))];    
% end
% 
% knownNumbers = knownNumbers + ones(size(knownNumbers));%Make it indices

randomGroupIndex = round(rand(1,1) * 9, 0) + 1;
randomSelectionIndex = round(rand(1,1) * 9, 0) + 1;

newImageData = masterDataset{randomGroupIndex}(:,:,randomSelectionIndex);

networkGuess = classify(net, newImageData);

actualLabel = numberToWord(randomGroupIndex - 1);

end

