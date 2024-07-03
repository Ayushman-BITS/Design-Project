% Define range for x2
x2_range = -20:0.1:20;

% Initialize arrays to store objective values
f1_values = zeros(size(x2_range));
f2_values = zeros(size(x2_range));

% Evaluate objectives for each x2 value
for i = 1:numel(x2_range)
    % Set x2 to the current value
    x2 = x2_range(i);
    
    % Evaluate objective functions
    obj_values = objectives_with_constraints([0, x2]); % Assuming x1 is fixed at 0
    
    % Extract f1 and f2 from obj_values
    f1 = obj_values(1);
    f2 = obj_values(2);
    
    % Store objective values
    f1_values(i) = f1;
    f2_values(i) = f2;
end

% Plot sensitivity analysis
figure;
subplot(2, 1, 1);
plot(x2_range, f1_values);
xlabel('x2');
ylabel('Objective f1');
title('Sensitivity Analysis for Objective f1');

subplot(2, 1, 2);
plot(x2_range, f2_values);
xlabel('x2');
ylabel('Objective f2');
title('Sensitivity Analysis for Objective f2');

