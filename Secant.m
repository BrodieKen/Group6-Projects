function [xr,i] = Secant(x0,x1,err,theta2)

%define variables
    i = 0;
    f0 = equation(x0,theta2);
    f1 = equation(x1,theta2);
    
while (true)
    i = i+1;

    if abs(f0)<abs(f1)
        temp = x0;
        x0 = x1;
        x1 = temp;

        temp = f0;
        f0 = f1;
        f1 = temp;
    end
    
    dfx = (f0-f1)/(x0-x1);
    x2 = x1-f1/dfx;

    ea = abs((x2-x1)/x2)*100;

    if ea < err
        xr = x2;
        break
    end

    f2 = equation(x2,theta2);
    x0 = x1;
    f0 = f1;
    x1 = x2;
    f1 = f2;      
end

end

