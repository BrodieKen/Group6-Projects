%Inputs: Initial Time (s), Initial Angle (deg),
%Initial Velocity (deg/s), Final Time (s), Step Size (s), Function
function [xvals,vvals] = rk4(t0, x0, v0, tf, h, f)

%Set initial values
t = t0; 
x = x0 * pi/180; %Convert to rad
v = v0 * pi/180; %Convert to rad/s

%Initialize Output Vectors
xvals = []; 
vvals = [];

%Repeat process for entire specified duration
while t<tf
    xvals = [xvals; x*180/pi]; %Convert back to deg
    vvals = [vvals; v*180/pi]; %Convert back to deg/s
    dx1 = h*v; %K1 for x
    dv1 = h*f(t,x,v); %K1 for v
    dx2 = h*(v + 0.5*dv1); %K2 for x
    dv2 = h*f(t + 0.5*h, x + 0.5*dx1, v + 0.5*dv1); %K2 for v
    dx3 = h*(v + 0.5*dv2); %K3 for x
    dv3 = h*f(t + 0.5*h, x + 0.5*dx2, v + 0.5*dv2); %K3 for v
    dx4 = h*(v + dv3); %K4 for x
    dv4 = h*f(t + h, x + dx3, v + dv3); %K4 for v
    x = x + 1/6*(dx1 + 2*dx2 + 2*dx3 + dx4); %Calculate next value for x
    v = v + 1/6*(dv1 + 2*dv2 + 2*dv3 + dv4); %Calculate next value for v
    t = t + h; %increment t by step size
end
end
