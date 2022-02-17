function [xr,iter] = bisection(xL,xU,err, theta2)
%this function takes in two points and an error goal to find the zero point
%for a given function using the Bisection method of finding roots.

    iter = 0;
    xold = 0;
    while(true)
        iter = iter + 1;
        
        %Find current half way point to bsect upper adn lower bounds
        x = (xL+xU)/2;
        
        if(iter>1)
            ea = abs((x-xold)/x)*100;   %find error of X off of actual value 
            if(ea < err)    %break if error is acceptable
                xr = x;
                fx = funct(xr, theta2);
                break
            end
        end

        f_xL = funct(xL, theta2);   %find f of lower bound
        f_x = funct(x, theta2);     %find f of bisected value
        
        if (f_xL *f_x <0)   %if bisected value is above lower, set new upper bound
            xU = x;
        elseif (f_xL * f_x) > 0 %if bisected value is below, set new lower bound
            xL =x;
        end
        xold = x;
    end       
end