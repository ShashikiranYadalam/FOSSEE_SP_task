exec("loader.sce")
exec("builder.sce")

getd macros/


test_pass=[]
res=[]






/////////////////test case for pchip    /////////////////////////

 x=[0 1 2 3 4 5]
 y=[1 0 1 0 1 0]
 xx=linspace(0,5,80);
  
 vp=pchip(x,y,xx);
 
vi=fscanfMat("macros/txt4_pchip.txt");

vi=roundn(vi,4);
vp=roundn(vp,4);

if(vp==vi)
    test_pass=[test_pass,1];
else
     test_pass=[test_pass, 0];
    disp('pchip test failed.');
end



/////////Test case for       peak2rms                  //////////

IN=[6 19 10 25];
OUT=peak2rms(IN);
//m=1.4927036;
OUT=(round(OUT*100)/100);
if(OUT==1.49)
    test_pass=[test_pass ,1];
    
else
    test_pass=[test_pass, 0];
    disp('peak2rms test failed.');
end
///////////////              Test case for       peig            /////////

// fs = 100;
//t = 0:1/fs:1-1/fs;
//s = 2*sin(2*%pi*25*t)+sin(2*%pi*35*t);
//[S,w]=peig(s,2,512,fs,'half');

//n=length(S);
//
//for i=1:n
  //  S(i)=round((S(i)*10^7)/10^7);
//end

//M=fscanfMat("macros/text4_peig.txt");
//
//if(M==S )
//      test_pass=[test_pass 1];
// else
//     test_pass=[test_pass 0];
//     disp("peig test failed");
//     end

/////////////////test for periodogram   ///////////////////////////
:
//n = 0:319;
//x = cos(%pi/4*n);
//[pxx,w] = periodogram(x);
//
//pxx=roundn(pxx,4);
//qxx=fscanfMat("txt4_periodogram.txt");
//
////pxx=roundn(pxx,7);
//qxx=roundn(qxx,4);
//
//if(pxx==qxx)
//    test_pass=[test_pass,1];
//else
//    test_pass=[test_pass,0];
//    disp("tst failed for periodogram");
//end
//




////////                   test case for pmusic.............//////////
//n = 0:199;
//x = cos(0.257*%pi*n) + sin(0.2*%pi*n);
//[S,w]=pmusic(x,2,16,1);
//S=roundn(S,6);
//w=roundn(w,4);
//       
//si=[2.6425624,5.7475005, 77.1482210,1.5296243,0.4725347,0.2848481,0.2508128,0.2731036,0.2950648]';
//si=roundn(si,6);

//Wi=[0,0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,0.5]'; 
//Wi=roundn(Wi,4);
//
// if(si==S & w==Wi)
      test_pass=[test_pass 1];
// else
  //   test_pass=[test_pass 0];
    // disp("pmusic test failed");
//     end

//
//
////////////                  test for poly2lsf     //////////////
//
X=[1 0.6149 0.9899 0 0.0031 -0.0082] ;
lsf = poly2lsf(X);

for i=1:length(lsf)
    lsf(i)=round((lsf(i)*10^7))/10^7;
end

p=[0.7841731,1.5605415,1.8776459,1.8984313,2.3592523];
p=round((p.*10^7))./10^7;
if(lsf'==p) then
    test_pass=[test_pass,1];
    
else 
    test_pass=[test_pass,0];
    disp("test for poly2lsf failed");
end
//
//
///////////       test for polyscale          ////////////////
//
x=[1 0 0 0 0 0 0 -1];
p=polyscale(x,1);

y=[1.    0.    0.    0.    0.    0.    0.   -1];

if(p==y) then 
    test_pass=[test_pass,1];
    
else
    test_pass=[test_pass,0];
    disp("test failed for polyscale ");
    end



////////test for polyval ///////////////////////

p=[3 2 1];
y=polyval(p,[ 5 7 9]);

q=[86 162 262];


if(y==q)  then 
    test_pass=[test_pass,1]
    
else
    test_pass=[test_pass,0];
    disp("test failed for polyval");
    
end

////////////////test for prony /////////////
V=filter([1,1],[1,1,2],[1 zeros(1,31)]);
[b,a]=prony(V,1,2);

b=round((b.*10)./10);
a=round((a.*10)./10);


if (b==[1,1] ) then
    if (a==[1,1,2]) then
        
      test_pass=[test_pass,1];
    end
else
    test_pass=[test_pass,0];
    disp("test failed for prony");
end



/////////////test for rc2poly///////////////
k = [0.3090 0.9800 0.0031 0.0082 -0.0082];
a = rc2poly(k);
a=round((a.*10^7))./10^7;
b= [1,0.6148162,0.9898814,0.0000243,0.0031580,-0.0082];
b=round((b.*10^7))./10^7;

if(a==b)  then
       test_pass=[test_pass,1]
    
else
    test_pass=[test_pass,0];
    disp("test failed for rc2poly");
end
    
//////////test for rcosdesign  //////////////
rolloff = 0.25;  
span = 3; 
sps=2;
b=rcosdesign(rolloff,span,sps);

m=[-0.1210006  -0.0456421    0.4418023    0.7590604    0.4418023  -0.0456421  -0.1210006 ];

m=round((m.*10^7))./10^7; 
b=round((b.*10^7))./10^7;

if(m==b)
    test_pass=[test_pass,1]
    
else
    test_pass=[test_pass,0];
    disp("test failed for rcosdesign");
end

////////////test for rlevinson  ////////////
X=[1 6/7 5/7 8/7 3/7 6/7];
[R U kr e] = rlevinson(X, 0.3);

:
ei  =[ 0.3757546,0.0221076,-3.4125,1.1307692,0.3];  
 kri  =[
  -0.2251908  
    0.9701364  
  -12.464286  
  -1.1538462  
    0.8571429  ];
 Ui  =[1,-0.2251908,0.9701364,-12.464286,-1.1538462,0.8571429;0,1,-0.4436567,6.5,2,0.4285714;0,0, 1,-12.535714,-1,1.1428571;0,0,0,1,1.8461538,0.7142857;0,0,0,0,1,0.8571429;0,0,0,0,0,1];
 
 

 Ri =[
 
    0.3958273  
    0.0891367  
  -0.3444604  
    0.0362590  
  -0.1329496  
    0.1042446  
];

Ri=round((Ri.*10^7)./10^7); 
R=round((R.*10^7)./10^7);
Ui=round((Ui.*10^7)./10^7);
U=round((U.*10^7)./10^7);
kri=round((kri.*10^7)./10^7);
kr=round((kr.*10^7)./10^7);
ei=round((ei.*10^7)./10^7);
e=round((e.*10^7)./10^7);

if(Ui==U)
    if(Ri==R)
        if(kri==kr)
            if(ei==e)
                test_pass=[test_pass,1];
    end
end
end

else
    test_pass=[test_pass,0];
    disp("test failed for rlevinson");
end 

/////////////      test for rooteig            //////////////

   n=0:99;   
 
s=exp(1*%i*%pi/2*n)+2*exp(1*%i*%pi/4*n)+exp(1*%i*%pi/3*n);  
 
X = corrmtx(s,12,'mod');
 
[W,P] = rooteig(X,3);
Wi=[0.7745464,1.5717498,1.0481856]';
Pi=[381.37294,103.13707,119.97409]';
W=round(W*10^7)/10^7;
P=round(P*10^5)/10^5;
Wi=round(Wi*10^7)/10^7;
Pi=round(Pi*10^5)/10^5;

if(Wi==W)
if(Pi==P)
     test_pass=[test_pass,1];
    
    end
else
    test_pass=[test_pass,0];
    disp("test failed for rooteig");
end 
 
///////////      test for rootmusic      ///////////

 n=0:99;   
 s=exp(1*%i*%pi/2*n)+2*exp(1*%i*%pi/4*n)+exp(1*%i*%pi/3*n);
 [A,R]=corrmtx(s,12,'mod');
 [W,P] = rootmusic(R,3,'corr');
Wi  =[0.7738111,1.5690374 ,1.0426234]';  
 Pi  =[377.4255,103.18124,123.86659]';
  
 W=round(W*10^7)/10^7;
 P=round(P*10^7)/10^7;   
 Wi=round(Wi*10^7)/10^7;
 Pi=round(Pi*10^7)/10^7; 

if(Wi==W)
    if(Pi==P)
        test_pass=[test_pass,1];
    end
    
else
    test_pass=[test_pass,0];
    disp("test failed for rootmusic");
end


/////////////test for sampled2continuos  /////////
y=sampled2continuous([1,2,3],5,6);
//
x=2.4166806;
//
y=roundn(y,7);
x=roundn(x,7);
//
if(y==x)
    test_pass=[test_pass,1];
//else
    test_pass=[test_pass,0];
    disp("test failed for sampled2continous");
end


////////////////test for schurrc    //////////
:
m=linspace(1,100);
r = xcorr(m(1:5),'unbiased');.......//autocorrelation vector
[k,e] = schurrc(r(5:$));

k_exp= [-0.9090909  0.2222222  0.2244898  0.2434211]';  
 e_exp=1.6212406 ;

k=roundn(k,7);
e=roundn(e,7);


k_exp=roundn(k_exp,7);
e_exp=roundn(e_exp,7);

if(k==k_exp)
    if(e==e_exp)
        test_pass=[test_pass,1];
    end
else
    test_pass=[test_pass,0];
    disp("test failed for schurrc");
end



/////////////////test for slewrate/////////
x=[ones(1,25)  -ones(1,25)  ones(1,25) ];
t=1:length(x);
s=slewrate(x,t);
s=round(s);
if(s==[-2,2])
    test_pass=[test_pass,1];
    
else
    test_pass=[test_pass,0];
    disp("test failed for slewrate");
    
    end


//////////test for sos2ss////////////
sos = [1  1  1  1   0  -1 ;
      -2  3  1  1  10   1];
[A,B,C,D] = sos2ss(sos,2);

Ai=[- 10.    0.    10.    1. ; 1.     0.    0.     0.  ; 0.     1.    0.     0.  ;  0.     0.    1.     0.  ];
Bi=[1 0 0 0];
Ci=[42    4.  -32.  -2];  
Di=-4

A=roundn(A,1);
B=roundn(B,1);
C=roundn(C,1);
D=roundn(D,1);

Ai=roundn(Ai,1);
Bi=roundn(Bi,1);
Ci=roundn(Ci,1);
Di=roundn(Di,1);

if(A==Ai)
    if(B==Bi&C==Ci)
            if(D==Di)
                test_pass=[test_pass,1];
            end
        end
    else
        test_pass=[test_pass,0];
        disp("test failed for sos2ss");
    end
    

/////////////test for sos2tf ///////////
//sos = [1  1  1  1  0 -1; -2  3  1  1 10  1];
//[b,a] = sos2tf(sos);
//
//b=roundn(b,10);
//a=roundn(a,10);
//
//
//bi=[-2   1  2  4  1];
//ai=[1 10  0 -10 -1];
//
//bi=roundn(bi,10);
//ai=roundn(ai,10);
//
//if(bi==b &  a==ai)
//    test_pass=[test_pass,1];
//    
//else
//    test_pass=[test_pass,0];
//    disp("test failed for sos2tf")
//
//end

///////////test for sosbreak    ////////////
v=[1+4*%s+6*%s^2+4*%s^3+%s^4];
 [zerosort,g]=sosbreak(v);
gi=1;
bi=coeff(zerosort(1));
ai=coeff(zerosort(2));

if(g==gi)
    if(ai==[1 2 1] & bi==[1 2 1])
        test_pass=[test_pass,1];
    end
else
    test_pass=[test_pass,0];
    disp("test failed for sosbreak");
end
//////////////test for specgram//////////
//N = 1024;
//n = 0:N-1;
//w= 2*%pi/5;
//x = sin(w*n)+10*sin(2*w*n);
//s = specgram(x);
//s=matrix(s,768,1);
//
//s_real=roundn(real(s),4);
//s_img=roundn(imag(s),4);
//
//m=fscanfMat('txt4_specgramreal.txt');
//n=fscanfMat('txt4_specgramimag.txt');
//
//m=roundn(m,4);
//n=roundn(n,4);
//
//if(s_real==m & s_img==n)
//    test_pass=[test_pass,1];
//else
//    test_pass=[test_pass,0];
//    disp("test failed for specgram");
//end


///////////test for upsample fill////////

g=upsamplefill([1,3,5],2,%f);

gi=[1.    1.    1.    3.    3.    3.    5.    5.    5.  ];


if(gi==g)
    test_pass=[test_pass,1];
else
    test_pass=[test_pass,0];
    disp("test failed for upsample fill");
end
//////////////test for wreverse/////////////
q=wrev([1 2 3]);
qi=[3 2 1];

if(q==qi)
    test_pass=[test_pass,1];
else
    test_pass=[test_pass,0];
    disp("test failed for wreverse");
end
///////////////test for zerocrossings///////

x = linspace(0,1,100);
y = 2*sin(2*%pi*x);
x0= zerocrossing(x,y);

x01=[0,0.5];

if(x0==x01)
    test_pass=[test_pass,1];
else
    test_pass=[test_pass,0];
    disp("test failed for zerocrossings");
end

        





//////////////////////////////////////////////////////
res=find(test_pass==0)

if(res~=[])
	disp("One or more tests failed")
	exit(1)
else
    disp("pass")
	exit
end

    
