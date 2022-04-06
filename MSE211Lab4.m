data = readtable("data.xlsx");

theta1_normal = mean(data.angle1) - data.angle1;
theta2_normal = mean(data.angle2) - data.angle2;
theta3_normal = mean(data.angle3) - data.angle3;
theta4_normal = mean(data.angle4) - data.angle4;
theta5_normal = mean(data.angle5) - data.angle5;

thetaMax1 = max(abs(theta1_normal));
thetaMax2 = max(abs(theta2_normal));
thetaMax3 = max(abs(theta3_normal));
thetaMax4 = max(abs(theta4_normal));
thetaMax5 = max(abs(theta5_normal));

thetaMax = [thetaMax1, thetaMax2, thetaMax3, thetaMax4, thetaMax5];

vMax1 = max(abs(data.speed1));
vMax2 = max(abs(data.speed2));
vMax3 = max(abs(data.speed3));
vMax4 = max(abs(data.speed4));
vMax5 = max(abs(data.speed5));

vMax = [vMax1, vMax2, vMax3, vMax4, vMax5];

p1 = polyfit(thetaMax(1:4), vMax(1:4), 1);
vMax5_model = p1*[thetaMax5; 1];
error = abs((vMax5 - vMax5_model)/vMax5);

%plot(0:75, p1(1)*(0:75) + p1(2), thetaMax(1:4), vMax(1:4), 'o', thetaMax5, vMax5_model, '*');

t0 = 0;
v0 = 0;
tf = 8;
h = 0.1;

m = 0.1270;
g = 9.81;
r = 0.1778;
I = 1.200e-3;
L = 0.3365;

f = @(t,x,v) -(m*g*r*sin(x))/(I+m*r^2);

[x1,v1] = rk4(t0, thetaMax1, v0, tf, h, f);
[x2,v2] = rk4(t0, thetaMax2, v0, tf, h, f);
[x3,v3] = rk4(t0, thetaMax3, v0, tf, h, f);
[x4,v4] = rk4(t0, thetaMax4, v0, tf, h, f);
[x5,v5] = rk4(t0, thetaMax5, v0, tf, h, f);

filter(1, 1, -data.speed1);

% figure();
% plot(0:h:8, v1, data.time1, -data.speed1);
% legend('Numerical Method', 'Experimental Data');
% title('Pendulum Velocity'); subtitle('\theta_{0} = 8.47\circ');
% xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
% 
% figure();
% plot(0:h:8, v2, data.time2, data.speed2);
% legend('Numerical Method', 'Experimental Data');
% title('Pendulum Velocity'); subtitle('\theta_{0} = 26.06\circ');
% xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
% 
% figure();
% plot(0:h:8, v3, data.time3, data.speed3);
% legend('Numerical Method', 'Experimental Data');
% title('Pendulum Velocity'); subtitle('\theta_{0} = 38.34\circ');
% xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
% 
% figure();
% plot(0:h:8, v4, data.time4, data.speed4);
% legend('Numerical Method', 'Experimental Data');
% title('Pendulum Velocity'); subtitle('\theta_{0} = 52.75\circ');
% xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
% 
% figure();
% plot(0:h:8, v5, data.time5, data.speed5);
% legend('Numerical Method', 'Experimental Data');
% title('Pendulum Velocity'); subtitle('\theta_{0} = 64.17\circ');
% xlabel('time, t (s)'); ylabel('velocity, V (m/s)');



