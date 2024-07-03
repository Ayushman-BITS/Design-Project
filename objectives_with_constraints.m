% function obj_values = objectives_with_constraints(x)
%     % Objective functions
%     f1 = 2 + (x(1) - 2)^2 + (x(2) - 1)^2;
%     f2 = 9 * x(1) - (x(2) - 1)^2;
%     obj_values = [f1, f2];
% end

function obj_values = objectives_with_constraints(x)
    % Objective functions
    f1 = 2 + (x(1) - 2)^2 + (x(2) - 1)^2;
    f2 = 9 * x(1) - (x(2) - 1)^2;

    % Penalty for constraint violations
    c1 = x(1)^2 + x(2)^2 - 225;
    c2 = x(1) - 3 * x(2) + 10;

    penalty = 1e-6; % Penalty factor for violating constraints (adjust as needed)
    penalty_c1 = max(0, c1)^2 * penalty;
    penalty_c2 = max(0, c2)^2 * penalty;

    % Penalized objectives
    penalized_f1 = f1 + penalty_c1;
    penalized_f2 = f2 + penalty_c2;

    obj_values = [penalized_f1, penalized_f2];
end
