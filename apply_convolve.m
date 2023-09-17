%%%%%%%%%%%%%  Function apply_convolve %%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PURPOSE: The main computational process of a CNN. This function will
%          apply a set of predefined linear filters and bias values to the input
%          image to compute each channel of the output image.
% INPUT:
%       An array of size N x M x D1
%       A filter bank of D2 filters of size R x C x D1
%       An array of D2 bias values
%
% OUTPUT:
%       An Array of size N x M x D2 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [outarray] = apply_convolve(inarray, filterbank, biasvals)

%Convert filterbank cell array to array
filterbank_2 = cell2mat(filterbank);

%Convert biasvals cell array to array
biasvalsArray = cell2mat(biasvals);

%get the size variables of filterbank
[R,C,D1,D2] = size(filterbank_2);

out3 = [];
for i = 1:D2 % For each filter in filterbank
    filtered_channel = zeros(length(inarray(1)));
    % extract i_th 3D array filter from filterbank_2
    filter = filterbank_2(:,:,:,i);
    
    for j = 1:D1 % For each channel in inarray
        % convolve each inarray channel with the filter
        filtered_channel = filtered_channel + imfilter(inarray(:,:,j), ...
            filter(:,:,j), 'same', 'conv', 0);
    end
    
    % add the filtered channel with the i_th bias values
    biased_channel = filtered_channel + biasvalsArray(i);
    % concatenate this channel to outarray
    out3 = cat(3, out3, biased_channel);
    
end
outarray = out3;
end
