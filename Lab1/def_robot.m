function xdot = def_robot(t, x)

    xdot = zeros(3, 1);  % Initialize the state vector

    % Define control parameters
    k_p = 3;
    k_alpha = 8;
    k_beta = -1.5;

    % Define goal (end) position
    x_f = 0;
    y_f = 0;
    theta_f = 0;

    % Compute control variables
    rho = sqrt((x_f - x(1))^2 + (y_f - x(2))^2);
    alpha = -x(3) + atan2(y_f - x(2), x_f - x(1));
    beta = -x(3) - alpha;

    % Control inputs
    v = k_p * rho;
    omega = k_alpha * alpha + k_beta * beta;

    % Define differential equations for the robot's motion
    xdot(1) = cos(x(3)) * v;  % Change in x-position
    xdot(2) = sin(x(3)) * v;  % Change in y-position
    xdot(3) = omega;  % Change in orientation
end