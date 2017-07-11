% #############################################################################################
% #########  YOU SHOULD MAINTAIN THE RETURN TYPE AND SHAPE AS PROVIDED IN STARTER CODE   ######
% #############################################################################################

function [params, param_winc] = sgd_momentum(w_rate, b_rate, mu, weight_decay, params, param_winc, param_grad)
% update the parameters with sgd with momentum

%% function input
% w_rate (scalar): learning rate for w at current step
% b_rate (scalar): learning rate for b at current step
% mu (scalar): momentum
% weight_decay (scalar): weigth decay of w
% params (cell array): original weight parameters
% param_winc (cell array): buffer to store history gradient accumulation
% param_grad (cell array): gradient of parameter

%% function output
% params (cell array): updated parameters
% param_winc (cell array): updated buffer

% TODO: your implementation goes below this comment
% implementation begins
num_his = size(param_winc, 2);
for n = 1:num_his
    gra_w_reg = param_grad{1,n}.w;
    gra_b_reg = param_grad{1,n}.b;
    gra_w_reg = gra_w_reg + weight_decay * params{1,n}.w;
    param_winc{1,n}.w = mu * param_winc{1,n}.w + w_rate * gra_w_reg;
    param_winc{1,n}.b = mu * param_winc{1,n}.b + b_rate * gra_b_reg;
    params{1,n}.w = params{1,n}.w - param_winc{1,n}.w;
    params{1,n}.b = params{1,n}.b - param_winc{1,n}.b;
end
% implementation ends

assert(all(size(params) == size(param_grad)), 'params_ does not have the right length');
assert(all(size(param_winc) == size(param_grad)), 'param_winc_ does not have the right length');

end
