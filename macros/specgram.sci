function [S_r, f_r, t_r] = specgram(x,n,fs,window,overlap)
//Generate a spectrogram for the signal x. The signal is chopped into overlapping segments of length n, and each segment is windowed and transformed into the frequency domain using the FFT. The default segment size is 256. If fs is given, it specifies the sampling rate of the input signal. The argument window specifies an alternate window to apply rather than the default of hanning (n). The argument overlap specifies the number of samples overlap between successive segments of the input signal. The default overlap is length (window)/2. 

//CALLING SEQUENCE:
//[S, f, t] = specgram (x,n,fs,window,overlap)
//where
//S is the complex output of the FFT, one row per slice
//f is the frequency indices corresponding to the rows of S
// t is the time indices corresponding to the columns of S.

//EXAMPLE 1:
//N = 1024;
//n = 0:N-1;
//w= 2*%pi/5;
//x = sin(w*n)+10*sin(2*w*n);
//s = specgram(x);// returns the short-time Fourier transform of the input signal, x.
 //Matplot(s)      //to see the spectrogram(partially)

funcprot(0);
rhs = argn(2)

if(rhs<1 | rhs>5)
error("Wrong number of input arguments.")
end
	select(rhs)
	case 1 then
	[S_r, f_r, t_r] = callOctave("specgram",x)
	case 2 then
	[S_r, f_r, t_r] = callOctave("specgram",x,n)
	case 3 then
	[S_r, f_r, t_r] = callOctave("specgram",x,n,fs)
	case 4 then
	[S_r, f_r, t_r] = callOctave("specgram",x,n,fs,window)
	case 5 then
	[S_r, f_r, t_r] = callOctave("specgram",x,n,fs,window,overlap)
	end
endfunction
