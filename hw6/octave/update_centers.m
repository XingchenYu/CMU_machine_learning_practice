%########################################################################
%#######  you should maintain the  return type in starter codes   #######
%########################################################################

function C = update_centers(X, C, a)
  % Input:
  %   X is the data matrix (n * d)
  %   C is the cluster centers (k * d)
  %   a is the cluster assignments (n * 1)
  % Output:
  %   C is the new cluster centers (k * d)
  for i = 1 : size(C, 1)
      Idx = find(a == i);
%       sum_x = 0;
%       sum_y = 0;  
      sum = zeros(size(C, 2),1);
      for j = 1 : length(Idx)
          for k = 1 : size(C, 2)
              sum(k) = sum(k) + X(Idx(j),k);
          end
%           sum_x = sum_x + X(Idx(j),1);
%           sum_y = sum_y + X(Idx(j),2);
      end
      for k = 1 : size(C, 2)
          C(i,k) = sum(k) / length(Idx);
      end
%       C(i,1) = sum_x / length(Idx);
%       C(i,2) = sum_y / length(Idx);
  end
end
