function w = triang (m)
[nargout,nargin]=argn();
  if (nargin ~= 1)
    error("wrong number of input arguments");
  elseif (~(isscalar (m) & (m == fix (m)) & (m > 0)))
    error ("triang: M must be a positive integer");
  end

  w = 1 - abs ([-(m-1):2:(m-1)]' / (m+modulo(m,2)));

endfunction
