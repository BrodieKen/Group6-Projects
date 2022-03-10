function [X,traj,f,k,Err] = Lab_2_sdm(x0,tol)
    k = 0; ea = 1;
    X = x0; traj=[];
    f(1) = Lab_2_Fun(X);
    Err=NaN;
    while ea > tol
        grad = Lab_2_Grad(X);
        hess = Lab_2_Hess(X);
        h = abs((transpose(grad)*grad)/(transpose(grad)*hess*grad));
        xnew = X - grad*h;
        traj = [traj xnew]; %Store solution in a vector
        k = k+1;
        ea = norm(xnew-X); %Evaluate error
        Err = [Err ea];
        X = xnew;
        f(2,1) = Lab_2_Fun(X);
    end
end