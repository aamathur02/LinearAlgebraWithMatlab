%% Part 1a
v1 = [1;0;-1];
v2 = [2;2;0];
v3 = [1;1;2];
x = [7;5;4]

P = [v1 v2 v3];
B = [v1 v2 v3 x];
rref(B)
disp("2v1 + 1v2 + 3v3 = x")
%%These are the coefficents of the vectors v1, v2, v3 that form x.

%% Part 1b
maxIndex = 5;



for c = 1:maxIndex
    D = [1 0 0 ;0 0.5 0; 0 0 0.5];
    
    A = (P * D^c * inv(P)) * x;

    fprintf("A to the %d power times x is equal to\n", c)
    disp(A)
end


%% Part 1c
dToTheK = diag([1 0 0]); 
%%when we multiply D to the K power, we can do 1 to the k power, which is 1,
%%and then 0.5 to the k power which eventually becomes 0. For that reason,
%%D to the k power, for a very large k is a diagonal matrix with the
%%diagonals 1, 0, and 0
%
AToTheK = (P * dToTheK * inv(P)) * x

%%When calculating D to the k power, we get the diagonal matrix, with diagonals 1, 0, and 0. Please read previous comment for my rational as to how I got this matrix for D to the K power. Essentially, when D to the K power is multiplies by any matrix F, the resultant matrix will be just the first column of the matrix F and then zeroes in the rest of the entries.
%%Therefore, when D to K power is multiplied by P, the resultant matrix will be a matrix where the first column is the eigenvector v1 and the rest of the matrix will be zeroes. Then when the resultant matrix is multiplied by P inverse, the resultant A becomes [1 -1 0; 0 0 0;-1 1 0]. In other words the only non zero values in A are the same values from the eigenvectors v1.
%%Now when we multiply A by x, we simply do some quick arithmetic to find our final answer of [2;0;-2]. The defining principle behind why our final result is a multiple of the first eigenvector v1 is because the matrix D to power of K isolates the first column of any matrix that is multiplied by it.

%% Part 2 - 25

p1 = [0 0 1 0 1/5; 1/3 0 0 1/2 1/5; 1/3 0 0 1/2 1/5; 1/3 1/2 0 0 1/5; 0 1/2 0 0 1/5];
k1(1:5,1:5) = 1/5;
%%G1 is the google matrix
G1 = 0.85 * (p1) + 0.15 * (k1)

zeroes = [0;0;0;0;0];
R1 = rref([G1-eye(5) zeroes]);
probabilityVector1 = -R1(:,5);
probabilityVector1(5,1)= 1;
probabilityVector1 = probabilityVector1/sum(probabilityVector1);

steadyState1 = G1^100;
pageRank1 = steadyState1(:,1)

%Page Rank from rank 1 to rank 5: 1,2,3,4 (2,3,4 are tied),5

%%The entry (3,2) in the G matrix represents the chance that someone on page 2 clicks the link to page three after k steps. 
%%After the damping factor adjustment is applied,there is a 0.03 chance that someone on page 2 clicks the link to page 3. 

%%The meaning of row 3 is the chances that someone on any of the 5 pages
%%clicks the link to page 3 after k steps. The entries in the row signify
%%the chances (after damping factor is applied) that someone from a page
%%represented by the column goes to page three after k steps.

%%Used guess and check to find the value k =15
G1^15
%% Part 2 - 26
p2 = [1/6 1/2 1/4 0 0 1/6;1/6 0 1/4 0 0 1/6;1/6 1/2 0 1/2 0 1/6;1/6 0 1/4 0 1/2 1/6;1/6 0 1/4 1/2 0 1/6;1/6 0 0 0 1/2 1/6];
k2(1:6,1:6) = 1/6;
%%G2 is the google matrix
G2 = 0.85 * (p2)  + 0.15 * (k2)

zeroes = [0;0;0;0;0;0];
R2 = rref([G2-eye(6) zeroes]);
probabilityVector2 = -R2(:,6);
probabilityVector2(6,1)= 1;
probabilityVector2 = probabilityVector2/sum(probabilityVector2);

steadyState2 = G2^100;
pageRank2 = steadyState2(:,1)

%Page Rank from rank 1 to rank 6: 3,4,5 (2 and 4 tied),1,6,2

%%The entry (3,2) of the Google Matrix as it approaches infinity is the
%%steady state probability that someone on page 2 will go to page 2. After
%%infiintely many steps, the general probabilty that someone from page 3
%%goes to page 2 is the entry in 3,2.

%%The third row of G is the long term set of probabilities that someone
%%from any ofthe 6 pages will go to page three. After infintely many steps,
%%the long term probabilty of going to page three is represented by the
%%entries in the row.

%%Used guess and check to find the value k = 14
G2^14

%% New test Section
A = [4 0 -4 -7;
     -5 9 9 9;
     6 -5 11 19;
     -1 3 5 -1]
 
C = transpose(A) * A
b = eig(C)

