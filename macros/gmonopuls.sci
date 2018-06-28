function y = gmonopuls(t, fc )
    
    // Copyright (C) 2007 Sylvain Pelissier <sylvain.pelissier@gmail.com>
//
// This program is free software; you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program; if not, see <http://www.gnu.org/licenses/>.


// Calling Sequence
//	[y]=gmonopuls(t)
//	[y]=gmonopuls(t,fc)
// Parameters
//	t: Real or complex valued vector or matrix
//	fc: Real non-negative value or complex value or a vector or matrix with not all real values negative.
// Description
//	This is an Octave function
//	This function returns samples of the Gaussian monopulse of amplitude unity.
// Examples
// 1.	gmonopuls([1 2 3],0.1)
//	ans= 0.85036   0.94070   0.52591
// 2.	gmonopuls([1 2 3],[])
//	ans= 0 0 0


    
    [nargout,nargin]=argn();

  if (nargin<1 | nargin > 2)
       error("wrong number of input arguments"); 
   end
   if(isempty(fc))
       fc=1e3;
       end
   
  if fc < 0 
       error("fc must be positive");
        end
  y = 2*sqrt(exp(1)) .* %pi.*t.*fc.*exp(-2 .* (%pi.*t.*fc).^2);

endfunction
