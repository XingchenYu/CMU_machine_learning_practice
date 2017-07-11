%########################################################################
%#######  you should maintain the  return type in starter codes   #######
%########################################################################

function [C, a] = lloyd_iteration(X, C)
  % Input:
  %   X is the data matrix (n * d)
  %   C is the initial cluster centers (k * d)
  % Output:
  %   C is the cluster centers (k * d)
  %   a is the cluster assignments (n * 1)

  pre_a = ones(size(X,1), 1);
  a = update_assignments(X, C);
  while (sum(pre_a == a) ~= length(a)) 
      pre_a = a;
      C = update_centers(X, C, a);
      a = update_assignments(X, C);
  end

end
