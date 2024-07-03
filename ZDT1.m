% ZDT1 Objective Function
function o = ZDT1(x)
    f1 = x(1);  % objective 1
    g = 1 + 9 * sum(x(2:end) / (numel(x) - 1));
    h = 1 - sqrt(f1 / g);
    f2 = g * h;  % objective 2

    o = [f1, f2];
end
