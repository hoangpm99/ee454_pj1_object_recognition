%%%%%%%%%%%%%  Routine demo_intermediate %%%%%%%%%%%%%%%%%%%%%
% PURPOSE: Display intermediate results of functions
% INPUT:
%       None
% OUTPUT:
%       Display representations of the output of:
%           a convolution layer
%           a relu layer
%           an imnormalize layer
%           a maxpool layer
%           the fullconnect layer
%           the softmax layer
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%loading this file defines imrgb and layerResults
load debuggingTest.mat

%loading this file defines filterbanks and biasvectors
load CNNparameters.mat

close all;
% Show image before and after imnormalize
inarray = double(imrgb);

normalized = apply_imnormalize(inarray);

figure; imagesc(imrgb);
figure; imagesc(normalized);

% Show 10 grayscale images after convolution
convolved = apply_convolve(normalized, filterbanks(1,2), biasvectors(1, 2));
figure; montage(convolved);
figure; montage(filterbanks{2}) % These are the filters applied at this level

% Show final 10 grayscale images at layer 16
layer_16_result = layerResults{16};
figure; montage(layer_16_result);
% the montage command appears to be interpolating a lot of data between the
% points that I am giving it, but still, it's interesting to look at

% plot the results of fullconnect
fullconnect = apply_fullconnect(layerResults{16}, ...
    cell2mat(filterbanks(1, 17)), cell2mat(biasvectors(1, 17)));
plot_fullconnect = reshape(fullconnect(1, 1, :), [10 1]);
figure;
b = bar(plot_fullconnect);
title("Output of FullConnect")
xlabel("Class")
ylabel("Non-Normalized Prediction score")
xtips = b(1).XEndPoints;
ytips = b(1).YEndPoints;
labels = string(b(1).YData);
text(xtips, ytips, labels, 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom')


% plot the results of softmax before and after
layer_17_result = layerResults{17};
softmaxxed = apply_softmax(layer_17_result);
plot_maxxed = reshape(softmaxxed(1, 1, :), [10 1]);
figure;
b = bar(plot_maxxed);
title("Output of Softmax")
xlabel("Class")
ylabel("Percent prediction")
xtips = b(1).XEndPoints;
ytips = b(1).YEndPoints;
labels = string(b(1).YData);
text(xtips, ytips, labels, 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom')
ylim([0 .6]);

% Try it out on a picture of a duck
test_image = imread('duck.jpg');
test_image = imresize(test_image, [32, 32]);
figure; imagesc(test_image);
outarray = CNN(test_image, filterbanks, biasvectors);
[maxprob, maxclass] = max(outarray);
fprintf('estimated class is %s with probability %.4f\n',...
    classlabels{maxclass}, maxprob)
% So understandably, the CNN believes this duck to be an image of a frog
