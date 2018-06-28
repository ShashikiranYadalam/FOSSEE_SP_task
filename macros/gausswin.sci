function w = gausswin (m, a)
[nargout,nargin]=argn();
  if (nargin < 1 | nargin > 2)
    error("wrong no. of input arguments");
  elseif (~ (isscalar (m) & (m == fix (m)) & (m > 0)))
    error ("gausswin: M must be a positive integer");
  elseif (nargin == 1)
    a = 2.5;
  end

  w = exp ( -0.5 * ( a/m * [ -(m-1) : 2 : m-1 ]' ) .^ 2 );

endfunction
