function result = equation(x,theta2)
    r1 = 7;
    r2 = 3;
    r3 = 8;
    r4 = 6;
    a = r1 - r2*cos(theta2);
    b = -r2*sin(theta2);
    c = (r3^2-a^2-b^2-r4^2)/(2*r4);

    result = a*cos(x)+b*sin(x)-c;

end