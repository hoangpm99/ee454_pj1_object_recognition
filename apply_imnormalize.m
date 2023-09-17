%%%%%%%%%%%%%  Function apply_fullconnect %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      approximately scales each color channel’s pixel values into the output range -0.5 to 0.5. 
%
% Input Variables:
%      f: a MxNx3 RGB image array
%      
% Returned Results:
%      Out: an array of same size
%
% 
%  Restrictions/Notes:
%        
%    Ruike Tang 09/13/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Out = apply_imnormalize(f)
f = double(f);
[M,N,C] = size(f);
for c = 1:C
    for x = 1:M
        for y = 1:N
            Out(x,y,c) = f(x,y,c)/255.0 - 0.5;
        end
    end
end
