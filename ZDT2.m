% ZDT2 Objective Function
function o = ZDT2(x)
    g = 1 + 9 * sum(x(2:end)) / (numel(x) - 1);
    % Calculate f1(x) and f2(x)
    f1 = x(1);
    f2 = g * (1 - (x(1) / g)^2); % objective 2 
    o = [f1, f2];
end