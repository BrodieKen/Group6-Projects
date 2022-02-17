function [fx,xr, iter] = secant(x0, x1, err, theta2)
%this function takes in two points and an error goal to find the zero point
%for a given function using the secant method of finding roots.

    %Calculate initial values of given points
    iter = 0;
    f0 = funct(x0,theta2);
    f1 = funct(x1,theta2);
    
    while(true)
        iter = iter + 1;
        
        if (abs(f0) < abs(f1)) %if f0 is less than f1, swap them to avoid errors with negative signs
            tempx = x0;
            x0 = x1;
            x1 = tempx;
            tempf = f0;
            f0 = f1;
            f1 = tempf;
        end
        
        %calculate backwards difference and find next point x2
        dfx = (f0-f1)/(x0-x1);
        x2 = x1 - f1/dfx;
        ea = abs((x2-x1)/x2)*100;
        
        %check how close x2 is to actual point within error range
        %if close return results
        if(ea < err)
            xr = x2;
            fx = funct(xr,theta2);
            break
        end
        
        %set new points based on results of secant method and repeat
        f2 = funct(x2,theta2);
        x0 = x1;
        f0 = f1;
        x1 = x2;
        f1 = f2;
    end
end