function gradient = Lab_2_Grad(vect)
  
    syms x y;
    f = (x.^2 + y - 11).^2 + (x + y.^2 - 7).^2;

    dx = diff(f, x);
    dy = diff(f, y);
    
    dx = subs(dx, x, vect(1));
    dx = subs(dx, y, vect(2));

    dy = subs(dy, x, vect(1));
    dy = subs(dy, y, vect(2));

    gradient = [dx; dy];

end