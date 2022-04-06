function [xvals,vvals] = rk4(t0, x0, v0, tf, h, f)

t = t0;
x = x0 * pi/180;
v = v0 * pi/180;

xvals = [];
vvals = [];

while t<tf
    xvals = [xvals; x*180/pi];
    vvals = [vvals; v*180/pi];
    dx1 = h*v;
    dv1 = h*f(t,x,v);
    dx2 = h*(v + 0.5*dv1);
    dv2 = h*f(t + 0.5*h, x + 0.5*dx1, v + 0.5*dv1);
    dx3 = h*(v + 0.5*dv2);
    dv3 = h*f(t + 0.5*h, x + 0.5*dx2, v + 0.5*dv2);
    dx4 = h*(v + dv3);
    dv4 = h*f(t + h, x + dx3, v + dv3);
    x = x + 1/6*(dx1 + 2*dx2 + 2*dx3 + dx4);
    v = v + 1/6*(dv1 + 2*dv2 + 2*dv3 + dv4);
    t = t + h;
end
end