%########################################################################
%#######  you should maintain the  return type in starter codes   #######
%########################################################################

function a = update_assignments(X, C)
  % Input:
  %   X is the data matrix (n * d)
  %   C is the cluster centers (k * d)
  % Output:
  %   a is the cluster assignments (n * 1)

  a = ones(size(X, 1), 1);
  tmp = zeros(size(C, 1), size(C, 2));
  
  for i = 1 : size(X, 1)
      res = zeros(size(C, 1), 1);
      for j = 1 : size(C, 2)
        tmp(:,j) = (C(:,j) - X(i, j)).^2;
%         tmp(:,2) = (C(:,2) - X(i, 2)).^2;
        res = res + tmp(:,j);
      end
      
      [M,I] = min(res);
      a(i) = I(1);
  end
end
