% function [c, ceq] = constraints(x)
%     % Nonlinear constraints
%     c1 = x(1)^2 + x(2)^2 - 225;
%     c2 = x(1) - 3 * x(2) + 10;
%     c = [c1, c2];
%     ceq = [];
% end

function [c, ceq] = constraints(x)
    % Nonlinear constraints
    c1 = x(1)^2 + x(2)^2 - 225;
    c2 = x(1) - 3 * x(2) + 10;
    
    % Inequality constraints
    c = [c1, c2];
    
    % No equality constraints
    ceq = [];
end

