clear;
clc;

m = 0.3; g = 9.81; r = 1; k = sqrt(m*g/r);
t0 = 0; h=0.1; tf = 8;

%% Mathemcatical Model

x = @(x0, lambda, t) x0*exp(-lambda*t/2/m)*(cos(sqrt(k^2/m - lambda^2/4/m^2)*t) + lambda/2/m/(sqrt(k^2/m - lambda^2/4/m^2))*sin(sqrt(k^2/m - lambda^2/4/m^2)*t));
v = @(x0, lambda, t) (x0*(-lambda^2*exp(-lambda*t/2/m)*sin(sqrt(k^2/m - lambda^2/4/m^2)*t) - 4*(sqrt(k^2/m - lambda^2/4/m^2))^2*m^2*exp(-lambda*t/2/m)*sin(sqrt(k^2/m - lambda^2/4/m^2)*t)))/4/m^2/sqrt(k^2/m - lambda^2/4/m^2);

x_m = zeros(81,12);
v_m = zeros(81,12);
i = 1;
for t = t0:h:tf
 x_m(i,:) = [x(5, 0.03, t), x(10, 0.03, t), x(15, 0.03, t), x(5, 0.05, t), x(10, 0.05, t), x(15, 0.05, t), x(5, 0.07, t), x(10, 0.07, t), x(15, 0.07, t), x(5, 0.09, t), x(10, 0.09, t), x(15, 0.09, t),];
 v_m(i,:) = [v(5, 0.03, t), v(10, 0.03, t), v(15, 0.03, t), v(5, 0.05, t), v(10, 0.05, t), v(15, 0.05, t), v(5, 0.07, t), v(10, 0.07, t), v(15, 0.07, t), v(5, 0.09, t), v(10, 0.09, t), v(15, 0.09, t),];
 i = i+1;
end

%% Runge Kutta

x0 = [5, 10, 15];
v0 = [0, 0, 0];

lambda = 0.03;
f4_rk = @(t,x,v) -(lambda*v + k^2*sin(x))/m;
f6_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x4a, v4a] = rk4(t0, x0, v0, tf, h, f4_rk);
[x6a, v6a] = rk4(t0, x0, v0, tf, h, f6_rk);

lambda = 0.05;
f4_rk = @(t,x,v) -(lambda*v + k^2*sin(x))/m;
f6_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x4b, v4b] = rk4(t0, x0, v0, tf, h, f4_rk);
[x6b, v6b] = rk4(t0, x0, v0, tf, h, f6_rk);

lambda = 0.07;
f4_rk = @(t,x,v) -(lambda*v + k^2*sin(x))/m;
f6_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x4c, v4c] = rk4(t0, x0, v0, tf, h, f4_rk);
[x6c, v6c] = rk4(t0, x0, v0, tf, h, f6_rk);

lambda = 0.09;
f4_rk = @(t,x,v) -(lambda*v + k^2*sin(x))/m;
f6_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x4d, v4d] = rk4(t0, x0, v0, tf, h, f4_rk);
[x6d, v6d] = rk4(t0, x0, v0, tf, h, f6_rk);

x4_rk = [x4a x4b x4c x4d];
v4_rk = [v4a v4b v4c v4d];

x6_rk = [x6a x6b x6c x6d];
v6_rk = [v6a v6b v6c v6d];

t = t0:h:tf;

%% Angles for lambda = 0.03
for i = 1:1:3
    figure();
    plot(t, x_m(:,i)', 'black', t, x4_rk(:,i)', '--r', t, x6_rk(:,i)', '.b')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.03', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Angles for lambda = 0.05
for i = 1:1:3
    figure();
plot(t, x_m(:,i+3)', 'black', t, x4_rk(:,i+3)', '--r', t, x6_rk(:,i+3)', '.b')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.05', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Angles for lambda = 0.07
for i = 1:1:3
    figure();
plot(t, x_m(:,i+6)', 'black', t, x4_rk(:,i+6)', '--r', t, x6_rk(:,i+6)', '.b')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.07', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Angles for lambda = 0.09
for i = 1:1:3
    figure();
plot(t, x_m(:,i+9)', 'black', t, x4_rk(:,i+9)', '--r', t, x6_rk(:,i+9)', '.b')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.09', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Velocity for lambda = 0.03
for i = 1:1:3
    figure();
    plot(t, v_m(:,i)', 'b', t, v4_rk(:,i)', '--r', t, v6_rk(:,i)', '.k')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.03', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

%% Velocity for lambda = 0.05
for i = 1:1:3
    figure();
    plot(t, v_m(:,i+3)', 'b', t, v4_rk(:,i+3)', '--r', t, v6_rk(:,i+3)', '.k')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.05', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

%% Velocity for lambda = 0.07
for i = 1:1:3
    figure();
    plot(t, v_m(:,i+6)', 'b', t, v4_rk(:,i+6)', '--r', t, v6_rk(:,i+6)', '.k')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.07', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

%% Velocity for lambda = 0.09
for i = 1:1:3
    figure();
    plot(t, v_m(:,i+9)', 'b', t, v4_rk(:,i+9)', '--r', t, v6_rk(:,i+9)', '.k')
    legend('Mathematical Model','Numerical Solution','Numerical Solution with Small Angle Approx.');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.09', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

%% random plot fun stuff
plot(t, (abs(((x4_rk(:,1)-x6_rk(:,1))./(x4_rk(:,1)))).*100)')
title('Error with using Small Angle approximation');
hold on
plot(t, (abs(((v4_rk(:,1)-v6_rk(:,1))./(v4_rk(:,1)))).*100)')
legend('Error in Displacement','Error in Velocity');
xlabel('time, t(s)');ylabel('error, %');
