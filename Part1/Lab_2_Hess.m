function hess = Lab_2_Hess(vect)
  
    syms x y;
    f = (x.^2 + y.^2 - 11).^2 + (x + y.^2 - 7).^2;

    dx = diff(f, x);
    dy = diff(f, y);

    ddx = diff(dx, x);
    dxdy = diff(dx, y);
    ddy = diff(dy, y);
    
    ddx = subs(ddx, x, vect(1));
    ddx = subs(ddx, y, vect(2));

    dxdy = subs(dxdy, x, vect(1));
    dxdy = subs(dxdy, y, vect(2));

    ddy = subs(ddy, x, vect(1));
    ddy = subs(ddy, y, vect(2));

    hess = [ddx, dxdy; dxdy, ddy];

end