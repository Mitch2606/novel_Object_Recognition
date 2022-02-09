function [guess] = workAround(net, imageData)
    guess = classify(net, imageData);
end