function [f, g, c] = three_bar_truss(x)
    % Constants
    P = 2; % KN/cm^2
    r = 2; % kN/cm^2
    l = 100; % cm

    % Objective function
    f = 2 * sqrt(2) * x(1) + x(2) * l;

    % Inequality constraints
    g(1) = ((sqrt(2) * x(1) + x(2)) / (sqrt(2) * x(1)^2 + 2 * x(1) * x(2))) * P - r;
    g(2) = (x(2) * P) / (x(1) + (sqrt(2) * x(2))) - r;
    g(3) = (P / (x(1) + (sqrt(2) * x(2)))) - r;

    % Box constraints
    c = x - [0; 0]; % Lower bound
    c = [c; 1 - x]; % Upper bound

    % Nonlinear inequality constraints
    g = g(:); % Ensure column vector for constraints
end
