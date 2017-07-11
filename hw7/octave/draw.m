%define lenet
layers{1}.type = 'DATA';
layers{1}.height = 28;
layers{1}.width = 28;
layers{1}.channel = 1;
layers{1}.batch_size = 64;

layers{2}.type = 'CONV';
layers{2}.num = 20;
layers{2}.k = 5;
layers{2}.stride = 1;
layers{2}.pad = 0;
layers{2}.group = 1;

layers{3}.type = 'POOLING';
layers{3}.k = 2;
layers{3}.stride = 2;
layers{3}.pad = 0;


layers{4}.type = 'CONV';
layers{4}.k = 5;
layers{4}.stride = 1;
layers{4}.pad = 0;
layers{4}.group = 1;
layers{4}.num = 50;


layers{5}.type = 'POOLING';
layers{5}.k = 2;
layers{5}.stride = 2;
layers{5}.pad = 0;

layers{6}.type = 'IP';
layers{6}.num = 500;
layers{6}.init_type = 'uniform';

layers{7}.type = 'RELU';

layers{8}.type = 'LOSS';
layers{8}.num = 10;



h_in = 28;
w_in = 28;
c = 1;
k = layers{2}.k;
pad = layers{2}.pad;
stride = layers{2}.stride;
group = layers{2}.group;
num = layers{2}.num;

% resolve output shape
h_out = 24;
w_out = 24;


input_n.height = h_in;
input_n.width = w_in;
input_n.channel = c;

% iterate over batches
input = xtest(:,202);
input_n.data = reshape(input, [28, 28, 1]);

    
    % reshape the input feature to [k*k*c, h_out*w_out]
    % for ease of processing
    col = im2col_conv(input_n, layers{2}, h_out, w_out);
    col = reshape(col, k*k*c, h_out*w_out);
    for g = 1:group
        col_g = col((g-1)*k*k*c/group + 1: g*k*k*c/group, :);
        weigth = params{1,1}.w(:, (g-1)*num/group + 1 : g*num/group);
        b = params{1,1}.b(:, (g-1)*num/group + 1 : g*num/group);
        % inner product
        tempoutput(:, (g-1)*num/group + 1 : g*num/group) = bsxfun(@plus, col_g'*weigth, b);
    end
    output.data = tempoutput(:);
    clear tempoutput;

% set output shape
output.height = h_out;
output.width = w_out;
output.channel = num;
output_n = reshape(output.data,[24,24,20]);
imshow(output_n(:,:,1));
figure(1)
for i = 1:20
   subplot(5,4,i)
   imshow(output_n(:,:,i));
end

tmp = zeros(12, 12, 20);

    input_p = output.data;
    input_p = reshape(input_p, [24, 24, 20]);
    for ch = 1:20
       for i = 1:12
           for j = 1:12
               pi = (i-1)*2;
               pj = (j-1)*2;
               pooling = input_p(pi+1:pi+2,pj+1:pj+2,ch);
               max_val = max(max(pooling));
               tmp(i, j, ch) = max_val;
           end
       end
    end
%     tmp_new = reshape(tmp,[h_out*w_out*c,1]);
%     output.data(:,n) = tmp_new;

figure(2)
for p = 1:20
    subplot(5,4,p)
    imshow(tmp(:,:,p));
end





    