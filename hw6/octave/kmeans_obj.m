%########################################################################
%#######  you should maintain the  return type in starter codes   #######
%########################################################################

function obj = kmeans_obj(X, C, a)
  % Input:
  %   X is the data matrix (n * d)
  %   C is the cluster centers (k * d)
  %   a is the cluster assignments (n * 1)
  % Output:
  %   obj is the k-means objective of the provided clustering (1 * 1)

  tmp = zeros(size(X, 1), size(X, 2));
  for i = 1 : size(X, 1)
      for j = 1 : size(X, 2)
          tmp(i,j) = (X(i,j) - C(a(i),j))^2;
      end
%       tmp(i,1) = (X(i,1) - C(a(i),1))^2;
%       tmp(i,2) = (X(i,2) - C(a(i),2))^2;
  end
  obj = sum(sum(tmp));
end
