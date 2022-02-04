function [xr,iter] = bisection(xL,xU,err, theta2)
    iter = 0;
    xold = 0;
    while(true)
        iter = iter + 1;
        x = (xL+xU)/2;
        if(iter>1)
            ea = abs((x-xold)/x)*100;
            if(ea < err)
                xr = x;
                fx = funct(xr, theta2);
                break
            end
        end
        f_xL = funct(xL, theta2);
        f_x = funct(x, theta2);
        if (f_xL *f_x <0)
            xU = x;
        elseif (f_xL * f_x) > 0
            xL =x;
        end
        xold = x;
    end       
end