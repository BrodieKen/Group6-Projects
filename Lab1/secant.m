function [fx,xr, iter] = secant(x0, x1, err, theta2)
    iter = 0;
    f0 = funct(x0,theta2);
    f1 = funct(x1,theta2);
    while(true)
        iter = iter + 1;
        if (abs(f0) < abs(f1))
            tempx = x0;
            x0 = x1;
            x1 = tempx;
            tempf = f0;
            f0 = f1;
            f1 = tempf;
        end
        dfx = (f0-f1)/(x0-x1);
        x2 = x1 - f1/dfx;
        ea = abs((x2-x1)/x2)*100;
        if(ea < err)
            xr = x2;
            fx = funct(xr,theta2);
            break
        end
        f2 = funct(x2,theta2);
        x0 = x1;
        f0 = f1;
        x1 = x2;
        f1 = f2;
    end
end