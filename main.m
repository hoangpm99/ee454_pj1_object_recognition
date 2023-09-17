
%loading this file defines imageset, trueclass, and classlabels
load cifar10testdata.mat
 
%loading this file defines filterbanks and biasvectors
load CNNparameters.mat

% the massive array of all of our predictions for each image
monolith = zeros(1, 1, length(classlabels), length(imageset));

for i = 1:length(imageset)
    % Run the CNN over every image in image set
    monolith(:, :, :, i) = CNN(imageset(:,:,:,i), filterbanks, biasvectors);
end

confusion = zeros(length(classlabels), length(classlabels));

for i = 1:length(monolith)
    % generate the confusion matrix
    [val, index] = max(monolith(:, :, :, i));
    confusion(double(trueclass(i)), index) = confusion(double(trueclass(i)), index) + 1;
end

correct = 0;
incorrect = 0;
for i = 1:length(classlabels)
    for j = 1:length(classlabels)
        if(i==j)
            correct = correct + confusion(i, j);
        end
        if(i ~= j)
            incorrect = incorrect + confusion(i, j);
        end
    end
end
accuracy = correct /(incorrect + correct);

kvals = zeros(1, length(classlabels));
for i = 1:length(classlabels)
    kvals(i) = topk(i, monolith, trueclass);
end

% Plot the Top-K values in a labeled bar graph
figure(1);
b = bar(kvals);
title("Top-K Values")
xlabel("K")
ylabel("Accuracy (with respect to top-k classes)")
xtips = b(1).XEndPoints;
ytips = b(1).YEndPoints;
labels = string(b(1).YData);
text(xtips, ytips, labels, 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom')
ylim([0 1.1]);
