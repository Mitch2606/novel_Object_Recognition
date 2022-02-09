function [xTrain, yTrain, questionableIndexes] = sleepyTime(net, xTrain, yTrain)

questionableIndexes = [];
parfor index = 1: size(yTrain, 1)
    oldLabel = yTrain(index);
    
    newLabel = classify(net, xTrain(:,:,:,index));
    
%     fprintf("\n" + string(oldLabel) + " | " + string(newLabel))
    
    if(oldLabel == newLabel)
       continue;
    else
        questionableIndexes = [questionableIndexes, index];
        yTrain(index) = newLabel;
        fprintf("\n" + string(oldLabel) + " | " + string(newLabel))
    end
    
end

