% #############################################################################################
% #########  YOU SHOULD MAINTAIN THE RETURN TYPE AND SHAPE AS PROVIDED IN STARTER CODE   ######
% #############################################################################################

function [input_od] = pooling_layer_backward(output, input, layer)
% Pooling backward

% Args:
% output: a cell array contains output data and shape information
% input: a cell array contains input data and shape information
% layer: one cnn layer, defined in testLeNet.m

% Returns:
% input_od: gradients w.r.t input data


input_od = zeros(size(input.data));

% TODO: your implementation goes below this comment
% implementation begins
h_in = input.height;
w_in = input.width;
c = input.channel;
batch_size = input.batch_size;
k = layer.k;
pad = layer.pad;
stride = layer.stride;

h_out = (h_in + 2*pad - k) / stride + 1;
w_out = (w_in + 2*pad - k) / stride + 1;

tmp = zeros(h_in, w_in, c);
for n = 1:batch_size
    input_n = input.data(:, n);
    input_n = reshape(input_n, [h_in, w_in, c]);
    outdiff = output.diff(:, n);
    outdiff = reshape(outdiff, [h_out, w_out, c]);
    for ch = 1:c
       for i = 1:h_out
           for j = 1:w_out
               pi = (i-1)*stride;
               pj = (j-1)*stride;
               pooling = input_n(pi+1:pi+k,pj+1:pj+k,ch);
               max_val = max(max(pooling));
               tmp(pi+1:pi+k,pj+1:pj+k,ch) ...
                   = double(pooling == max_val) * outdiff(i,j,ch);
           end
       end
    end
    tmp_new = reshape(tmp,[h_in*w_in*c,1]);
    input_od(:,n) = tmp_new;
end
% implementation ends

assert(all(size(input.data) == size(input_od)), 'input_od does not have the right length');

end
