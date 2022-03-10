clear;
clc;

%Define call function numerically
[x1,y1] = meshgrid(-5:0.1:5,-5:0.1:5);
f = (x1.^2 + y1 - 11).^2 + (x1 + y1.^2 - 7).^2;

% Plot surface
surface = figure; figure(surface);
surf(x1,y1,f); shading interp;
x0 = [0; 0]; %Initial Guess

%Call Methods (Use % before each line to comment the methods you are not testing)

%[X,traj,Z,k,Err] = Lab_2_sdm(x0, 10^(-4));
[X,traj,Z,k,Err] = Lab_2_Newton(x0, 10^(-4));
% 
%options = optimoptions('fminunc','GradObj','on','Algorithm','trust-region');
%[X,FVAL,EXITFLAG,OUTPUT] = fminunc(@Lab_2_Fun,x0);



% Add trajectory for finding minima (3D plot)
hold on
plot3(traj(:,1), traj(:,2), Z(:,1) ,'-k+')

%Plot contour (2D plot)
contour_graph = figure; figure(contour_graph);
contour(x1,y1,f,100); hold on;
plot(X(1,:), X(2,:),'-k+')