%%%%%%%%%%%%%  Function apply_softmax %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Convert the vector of arbitrary real numbers to numbers 
%       that can be viewed as probabilities. I.e. they all lie
%       between 0 and 1 and sum up to 1
%
% Input Variables:
%      In: an array of size 1 x 1 x D
%      
% Returned Results:
%      softmax: an array of size 1 x 1 x D
%
% 
%  Restrictions/Notes:
%      In must be defined as above  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function softmax = apply_softmax(In)

D = size(In);
D = D(3);
a = max(In(1,1,:));
denom = sum(exp(In(1,1,:) - a));
softmax = zeros(1, 1, D);

for k = 1 : D
    softmax(1,1,k) = exp(In(1,1,k)-a)/denom;
end