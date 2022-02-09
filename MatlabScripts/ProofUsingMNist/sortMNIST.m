load('mnist.mat')

labelToFind = 1;

masterDataset = [];

for labelToFind = 0: 9
    indices = find(training.labels == labelToFind);
    dataset = training.images(:,:,indices);
    masterDataset = [masterDataset; {dataset}];
end

figure
for i = 1: 9
    subplot(3,3,i)
    imshow(masterDataset{i}(:,:,1))
end

save("masterDataset.mat", 'masterDataset')
