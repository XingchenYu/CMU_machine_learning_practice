function a = kernel_perceptron_train(a0, XTrain, yTrain, num_epoch, s)
%   a0 is the initial counting vector (n * 1)
%   XTrain is feature values of training examples (n * d)
%   yTrain is labels of training examples (n * 1)
%   num_epoch is the number of times to go through the data (1 * 1)
%   s is parameter sigma in RBF function (1 * 1)
%   a is the trained counting vector (n * 1)

%#################################################################################
%####   you should maintain the size of the return value in starter codes  #######
%#################################################################################

  a = a0;
  K = RBF_kernel(XTrain, XTrain, s);
  for i = 1 : num_epoch
      for j = 1 : size(XTrain, 1)
          a_y = a .* yTrain;
          z = K(j,:) * a_y;
          if (z <= 0)
              pred = -1;
          else 
              pred = 1;
          end
          if (pred ~= yTrain(j))
              a(j) = a(j) + 1;
          end
      end
  end
  
end


