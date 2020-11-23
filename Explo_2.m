%% Question Setip

C=[.1588  .0064  .0025  .0304  .0014  .0083  .1594 ;
   .0057  .2645  .0436  .0099  .0083  .0201  .3413 ; 
   .0264  .1506  .3557  .0139  .0142  .0070  .0236 ; 
   .3299  .0565  .0495  .3636  .0204  .0483  .0649 ; 
   .0089  .0081  .0333  .0295  .3412  .0237  .0020 ; 
   .1190  .0901  .0996  .1260  .1722  .2368  .3369 ;
   .0063  .0126  .0196  .0098  .0064  .0132  .0012 ];
d=[74000 ; 56000 ; 10500  ; 25000 ; 17500 ; 196000 ;  5000 ];
d2=[ 99640 ; 75548 ; 14444 ; 33501 ; 23527 ; 263985 ; 6526 ];

%% Question A
format bank
V  = [1 1 1 1 1 1 1];
V * C

% The entries of V * C vonfirm that that matrix C is a consumption matrix
% becaause the column sum of each column in V * C is less than 1. This
% makes sense as each sector should require less than 1 unit of input to
% create 1 unit of output

%% Question b
format bank
I = eye(7);
B = I - C;
M = [B d];
rref(M)

% I used the (I-C)x = d equation. Matrix B is the I-C matrix. And M is the
% augmented matrix

%% Question C
format bank
A = inv(B);
F = A * d

% X is equal to F

%% Question d
format bank
L = I + C + C^2 + C^3 + C^4 + C^5 + C^6 + C^7 + C^8 + C^9 + C^10 + C^12 + C^13 + C^14 + C^15 + C^16;
L * d
% k = 16 is the lowest value 
% L * d is equal to the x


%% Question b using d2
format bank
M = [B d2];
rref(M)

%% Question c using d2
format bank
A * d2

%% Question d using d2

F = A * d2
L = I + C + C^2 + C^3 + C^4 + C^5 + C^6 + C^7 + C^8 + C^9 + C^10 + C^12 + C^13 + C^14 + C^15 + C^16 + C^17 + C^18 ;
L * d2

% k = 18 is the smallest value
