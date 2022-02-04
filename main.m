clc;
clear;

%define variables
err = 10^-6;

%find constants



x = 0:0.01:2*pi;
theta2 = pi/3;
x0 = 4.13;
x1 = 4.15;

fx = equation(x,theta2);

%% Graphical Method
plot(x,fx,[0,2*pi],[0,0]);

% number of roots: 2
% first root: 1.25
% first interval: 1.24 < xr < 1.26
% second root: 4.14
% second interval: 4.13 < xr < 4.15



%% Bisection Method


%% Secant Method
theta2 = pi/3;
[xr,iterations] = Secant(x0,x1,err,theta2);


%% Implementation
theta2 = 0;
i = 1;
x0 = 0;
x1 = pi;
x2 = 2*pi;


while theta2 <=4*pi
    
    [theta4A(i),~] = bisection(x0,x1,err,theta2);
     
     
    [theta4B(i),~] = bisection(x1,x2,err,theta2);
    theta2 = theta2+ (pi/36);
    i = i+1;
end
plot([0:pi/36*180/pi:4*pi*180/pi],theta4A*180/pi,[0:pi/36*180/pi:4*pi*180/pi],theta4B*180/pi);

    
    