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

%compare experimental and theoretical
xe = [4.6212 3.7305 3.3963 2.7272 0.0001827 0.0000898 ...
        0.0000337 0.0000343 0.0000931 0.0001827]';   %experimental results of the voltges and currents

    % difference between experimental results and actual results
c = A*xe - x;
error = norm(c)

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

