%%%%%%%%%%%%%  Function CNN %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Run the convolutional neural network for a given image
%       and filterbank, biasvalues
%
% Input Variables:
%      In: image
%      F: a filterbank of size N x M x D_1 x D_2
%      B: bias value vector of size D_2
%      
% Returned Results:
%      Out: an array of size 1 x 1 x D_2
%
% 
%  Restrictions/Notes:
%      In must be defined as above  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [outarray] = CNN(imrgb, filterbanks, biasvectors)
inarray = double(imrgb);

%find the correct filterbank for the layers that need them
i = 2;
filterbank = filterbanks(1,i);
biasvals = biasvectors(1,i);

%layer 1
outarray = apply_imnormalize(inarray);

%layer 2
outarray = apply_convolve(outarray, filterbank, biasvals);
i = i+1;

%layer 3
outarray = apply_relu(outarray);
i = i+1;

%layer 4
filterbank = filterbanks(1,i);
biasvals = biasvectors(1,i);
outarray = apply_convolve(outarray, filterbank, biasvals);
i = i+1;

%layer 5
outarray = apply_relu(outarray);
i = i+1;

%layer 6
outarray = apply_maxpool(outarray);
i = i+1;

%layer 7
filterbank = filterbanks(1,i);
biasvals = biasvectors(1,i);
outarray = apply_convolve(outarray, filterbank, biasvals);
i = i+1;

%layer 8
outarray = apply_relu(outarray);
i = i+1;

%layer 9
filterbank = filterbanks(1,i);
biasvals = biasvectors(1,i);
outarray = apply_convolve(outarray, filterbank, biasvals);
i = i+1;

%layer 10
outarray = apply_relu(outarray);
i = i+1;

%layer 11
outarray = apply_maxpool(outarray);
i = i+1;

%layer 12
filterbank = filterbanks(1,i);
biasvals = biasvectors(1,i);
outarray = apply_convolve(outarray, filterbank, biasvals);
i = i+1;

%layer 13
outarray = apply_relu(outarray);
i = i+1;

%layer 14
filterbank = filterbanks(1,i);
biasvals = biasvectors(1,i);
outarray = apply_convolve(outarray, filterbank, biasvals);
i = i+1;

%layer 15
outarray = apply_relu(outarray);
i = i+1;

%layer 16
outarray = apply_maxpool(outarray);
i = i+1;

%layer 17
filterbank = cell2mat(filterbanks(1,i));
biasvals = cell2mat(biasvectors(1,i));
outarray = apply_fullconnect(outarray, filterbank, biasvals);
i = i+1;

%layer 18
outarray = apply_softmax(outarray);
end