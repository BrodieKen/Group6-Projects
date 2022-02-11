clc;
clear;

err = 10^-6;

r1 = 7;
r2 = 3;
r3 = 8;
r4 = 6;
 
range = [0:pi/36:2*pi];
i = 1;


for theta2 = range
    
    [theta4A(i), ~] = bisection(0,pi, err, theta2);
    [theta4B(i), ~] = bisection(pi,2*pi, err, theta2);
    
    b = -r2*sin(theta2);
    
    theta3A(i) = asin((b+r4*sin(theta4A(i)))/r3);
    theta3A(i) = atan2(sin(theta3A(i)), cos(theta3A(i)));
    
    theta3B(i) = asin((b+r4*sin(theta4B(i)))/r3);
    theta3B(i) = atan2(sin(theta3B(i)), cos(theta3B(i))) + 2*pi; % i added 2pi cuz answer was negative, idk if it makes sense tho
    
    i = i + 1;
end

%Plot the change of theta 3 and theta 4 with respect to theta 2
subplot(2,2,1);
plot(rad2deg(range), rad2deg(theta4A), rad2deg(range), rad2deg(theta3A));
xlabel('Theta2 (deg)') 
legend('Theta4 (deg)','Theta3 (deg)');
title('Mechanism A');


subplot(2,2,3);
plot(rad2deg(range), rad2deg(theta4B), rad2deg(range), rad2deg(theta3B));
xlabel('Theta2 (deg)') 
legend('Theta4 (deg)','Theta3 (deg)');
title('Mechanism B');



%animate the bars being plotted
theta2 = [0:pi/36:2*pi];
n = 1;
while true 
    if n == 72
        n = 1;
    end
    
    
    
    sp1 = subplot(2,2,2);
    hold on
    animate(theta2(n),theta3A(n),theta4A(n));
    
    sp2 = subplot(2,2,4);
    hold on
    animate(theta2(n),theta3B(n),theta4B(n));

    cla(sp1)
    cla(sp2)

    n = n + 1;
end