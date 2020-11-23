%% Question 1
41 + 57

%% Question 2
A  = [1 2 3; 2 -1 3; 4 -2 12];

b = [115; 1421; 4214];
A\b
M = [A b];
rref(M)
% The last column of M is the augmented column of the matrix. Additonally,
% there is no row where the coefficiants of the row are zero and the
% augmented value for tat row is non-zero. Therefore, the solution is
% consistent. Additonally, because there are no free variables we do indeed
% have a unique solution

%% Question3
M = [ 4 -7 -33; -3 8 44; -3 7 37];
rref(M)

% x1 = 4, x2 = 7
%This system can be consistent as there is not row where the coefficients
%are zero and the augmented value is nonzero
%

%% Question 4
A = [1 2 3; 2 -1 3];
b = [115; 1421];
A\b

M = rref([A b])

% 
%Because the augmented matrix contains a free variable and is consistent, 
%there are infintely many solutions as any value can be passed for the free
%variable and the matrix will have an solution due to the consistency of
%the augmented matrix. 

v = M(:,4)
w = M(:,3)



