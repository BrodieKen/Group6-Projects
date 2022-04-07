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
f_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x1, v1] = rk4(t0, x0, v0, tf, h, f_rk);

lambda = 0.05;
f_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x2, v2] = rk4(t0, x0, v0, tf, h, f_rk);

lambda = 0.07;
f_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x3, v3] = rk4(t0, x0, v0, tf, h, f_rk);

lambda = 0.09;
f_rk = @(t, x, v) -(lambda*v + k^2*x)/m;
[x4, v4] = rk4(t0, x0, v0, tf, h, f_rk);

x_rk = [x1 x2 x3 x4];
v_rk = [v1 v2 v3 v4];

t = t0:h:tf;

%% Angles for lambda = 0.03
for i = 1:1:3
    figure();
    plot(t, x_m(:,i)', 'black', t, x_rk(:,i)', 'red')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.03', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Angles for lambda = 0.05
for i = 1:1:3
    figure();
    plot(t, x_m(:,i+3)', 'black', t, x_rk(:,i+3)', 'red')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.05', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Angles for lambda = 0.07
for i = 1:1:3
    figure();
    plot(t, x_m(:,i+6)', 'black', t, x_rk(:,i+6)', 'red')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.07', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Angles for lambda = 0.09
for i = 1:1:3
    figure();
    plot(t, x_m(:,i+9)', 'black', t, x_rk(:,i+9)', 'red')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Angle'); subtitle(sprintf('θ = %dº, λ= 0.09', 5*i));
    xlabel('time, t (s)'); ylabel('angle, \theta (\circ)');
end

%% Velocity for lambda = 0.03
for i = 1:1:3
    figure();
    plot(t, v_m(:,i)', 'green',  t, v_rk(:,i)', 'blue')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.03', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

%% Velocity for lambda = 0.05
for i = 1:1:3
    figure();
    plot(t, v_m(:,i+3)', 'green',  t, v_rk(:,i+3)', 'blue')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.05', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

%% Velocity for lambda = 0.07
for i = 1:1:3
    figure();
    plot(t, v_m(:,i+6)', 'green',  t, v_rk(:,i+6)', 'blue')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.07', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

%% Velocity for lambda = 0.09
for i = 1:1:3
    figure();
    plot(t, v_m(:,i+9)', 'green',  t, v_rk(:,i+9)', 'blue')
    legend('Mathematical Model','Runge-Kutta');
    title('Simulated Pendulum Speed'); subtitle(sprintf('θ = %dº, λ= 0.09', 5*i));
    xlabel('time, t (s)'); ylabel('velocity, V (m/s)');
end

