function [list] = gan()
list = size(1:10000);
sum = 0;
cnt = 0;
while sum < 10000
  tmp = rand;
  if (tmp < 0.45)
    t = 0;
  else
    t = 1;
  end
  tmp = rand;
  if (tmp < 0.2)
    c = 0;
  else
    c = 1;
  end
  %e
  tmp = rand;
  if t == 0 && c == 0
    if tmp < 0.8
      e = 0;
    else
      e = 1;
    end
  elseif t == 0 && c == 1
    if tmp < 0.3
      e = 0;
    else
      e = 1;
    end
  elseif t == 1 && c == 0
    if tmp < 0.5
      e = 0;
    else
      e = 1;
    end
  else
    if tmp < 0.1
      e = 0;
    else
      e = 1;
    end
  end 
  %h
  tmp = rand;
  if c == 0
      if tmp < 0.75
          h = 0;
      else
          h = 1;
      end
  else
      if tmp < 0.2
          h = 0;
      else
          h = 1;
      end
  end
  %g
  tmp = rand;
  if e == 0 && h == 0
    if tmp < 0.05
      g = 1;
    else
      g = 0;
    end
  elseif e == 0 && h == 1
    if tmp < 0.3
      g = 1;
    else
      g = 0;
    end
  elseif e == 1 && h == 0
    if tmp < 0.3
      g = 1;
    else
      g = 0;
    end
  else
    if tmp < 0.2
      g = 1;
    else
      g = 0;
    end
  end 
  if g == 1
      sum = sum + 1;
      if c == 1
          cnt = cnt + 1;
      end
      list(sum) = cnt/sum;
  end
end
end