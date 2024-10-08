r = 50;
theta_0 = 0;

hold on  % Keep the plots on the same figure
angles = linspace(-pi, pi, 6);  % Generate 6 equally spaced angles
for angle = angles  % Vary the starting angle
    x_0 = r * cos(angle);
    y_0 = r * sin(angle);
    X0 = [x_0, y_0, theta_0];
    
    [t, y] = ode45(@def_robot, [0, 20], X0);
    
    x1 = y(:,1);  % Extract x-coordinates
    y1 = y(:,2);  % Extract y-coordinates
    
    plot(x1, y1);  % Plot the trajectory for each start position
end

xlabel('X');
ylabel('Y');
hold off