function pred = kernel_perceptron_predict(a, XTrain, yTrain, x, s)
%   a is the counting vector (n * 1)
%   XTrain is feature values of training examples (n * d)
%   yTrain is labels of training examples (n * 1)
%   x is feature values for test example (1 * d)
%   s is parameter sigma in RBF function (1 * 1)
%   pred is the predicted label for x (1 * 1)

%#################################################################################
%####   you should maintain the size of the return value in starter codes  #######
%#################################################################################
    z = 0;
    a_y = a .* yTrain;
    k = RBF_kernel(x, XTrain, s);
    for r = 1 : size(XTrain, 1) 
        z = z + a_y(r) * k(r);
    end
    if z <= 0
        pred = -1;
    else 
        pred = 1;
    end
end

