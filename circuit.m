A = [1 0 0 0 2200 0 0 0 0 0;
    1 -1 0 0 0 -10000 0 0 0 0;
    1 0 0 -1 0 0 -20000 0 0 0;
    0 1 0 -1 0 0 0 -18000 0 0;
    0 1 -1 0 0 0 0 0 -10000 0;
    0 0 1 -1 0 0 0 0 -20000 0;
    0 0 0 1 0 0 0 0 0 -15000;
    0 0 0 0 1 -1 -1 0 0 0;
    0 0 0 0 0 1 0 -1 -1 0;
    0 0 0 0 0 0 1 1 1 -1;];

b = [5 0 0 0 0 0 0 0 0 0]';

x = A \ b;

% idk what this mean
% c = A.*x - b;
% norm(c)

normFrobA = cond(A);
normOneA = cond(A, 1);
normInfA = cond(A, inf);

%2Mohm matrix & norms
A2 = A;
A2(7,10) = -2e6;

normFrobA2 = cond(A);
normOneA2 = cond(A, 1);
normInfA2 = cond(A, inf);

%Call LU func
x2 = LU_decomp(A,b);

%{
To Do:
Compare your results (theoretical vs. experimental) and report the amount of errors and the
possible reasons of any discrepancy.
%}

