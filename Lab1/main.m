%To use this lab, run each code snippet seperatley, otherwise it will only show the results of implementation 

%% Graphical Method
clc;
clear;

%initialize range of theta 4 angles to graph results of the function
angles = 0:0.01:2*pi;

%calculate f(x) for each gievn theta 4, fix theta 2 at pi/3
fxn = funct(angles,pi/3);

plot(angles,fxn,[0,2*pi],[0,0]);

%% Bisection Method
clc;
clear;

% change Xl and Xu to find different zero points
Xl = 4.0;   %1.1 or 4.0
Xu = 4.2;   %1.3 or 4.2
Theta2 = pi/3;

err = 10^-6;

% solve for theta 4 using the bisection method 
[theta4, iterations] = bisection(Xl,Xu, err, Theta2);


%view results in workspace on side bar

%% Secant Method
clc;
clear;

% change Xl and Xu to find different zero points
Xl = 4.0;   %1.1 or 4.0
Xu = 4.2;   %1.3 or 4.2
Theta2 = pi/3;
err = 10^-6;

% solve for theta 4 using the secant method
[~,theta4, iterations] = secant(Xl,Xu, err,Theta2);

%view results in workspace on side bar

%% Implimentation
clc;
clear;

err = 10^-6;

%deine lengths of bars for animation and theta 3 calculations
r1 = 7;
r2 = 3;
r3 = 8;
r4 = 6;

%define a range of theta 2 value sto check
range = [0:pi/36:2*pi];
i = 1;


for theta2 = range
    
    %calculate and save a vector of theta 4 values for
    %both modes of operation
    [theta4A(i), ~] = bisection(0,pi, err, theta2);
    [theta4B(i), ~] = bisection(pi,2*pi, err, theta2);
    
    b = -r2*sin(theta2);
    
    %calculate and save a vector of theta 3 values for
    %both modes of operation
    theta3A(i) = asin((b+r4*sin(theta4A(i)))/r3);
    theta3A(i) = atan2(sin(theta3A(i)), cos(theta3A(i)));
    
    theta3B(i) = asin((b+r4*sin(theta4B(i)))/r3);
    theta3B(i) = atan2(sin(theta3B(i)), cos(theta3B(i))) + 2*pi;
    
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
n = 1;
while true 
    %reset frame count based on number of frames from range
    if n == length(range)
        n = 1;
    end
    
    
    %plot mechanism A on top right
    sp1 = subplot(2,2,2);
    hold on
    animate(range(n),theta3A(n),theta4A(n));
    
    %plot mechanism B on bottom right
    sp2 = subplot(2,2,4);
    hold on
    animate(range(n),theta3B(n),theta4B(n));

    cla(sp1)
    cla(sp2)

    n = n + 1;
end