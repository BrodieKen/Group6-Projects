function [x] = LU_decomp(A, b)
    [L,U,P] = lu(A);
    n = length(L);
    
    %Forward Substitution
    d = zeros(n, 1);
    d(1) = (1/L(1,1))*(b(1));
    
    for i = 2:1:n
        sum = 0;
        for k = 1:1:(i-1)
            sum = sum - L(i,k) * d(k);
        end
        d(i) = (1/L(i,i))*(b(i) + sum);
    end
    
    %Backward Substituion
    m = length(U);
    x = zeros(m,1);
    x(m)= d(m) ./ U(m,m);
    
    for i = (m-1):-1:1
        sum = 0;
        for k = (i+1):1:m
            sum = sum - U(i,k)* x(k);
        end
        x(i) = (1/U(i,i))*(d(i) + sum);
    end
    
    %Check that x is Correct Solution 
    %(check = 1 if x_i is the same as (A\b)_i within 10 digits after the
    %decimal)
    check = logical(round(x, 10) == round(A\b, 10));
    for i = 1:length(check)
        if check(i) == 0
            error("LU Decomp Failed");
        end
    end
end










