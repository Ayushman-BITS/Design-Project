% Define parameters for MSCSO_MO function
SearchAgents_no = 50;
Max_iter = 100;
lb = [0, 0];
ub = [700, 700];
dim = 2;
% Objective function handle
F33 = @CropOptimization;
% Call the multi-objective optimization function
[Best_Pareto_Score, Pareto_Front, Convergence_curve, Pareto_Parents] = MSCSO_MO(SearchAgents_no, Max_iter, lb, ub, dim, F33);

% Display results or perform further analysis as needed
disp('Best Pareto Score:');
disp(Best_Pareto_Score);

%disp('Pareto Front:');
%disp(Pareto_Front);

% % Plot the convergence curve
% figure;
% plot(1:Max_iter, Convergence_curve);
% xlabel('Iteration');
% ylabel('Best Pareto Score');
% title('Convergence Curve');

% Plot the convergence curve
figure;
subplot(1, 2, 1);
plot(1:Max_iter, Convergence_curve);
xlabel('Iteration');
ylabel('Best Pareto Score');
title('Convergence Curve');

% Plot the Pareto front
% subplot(1, 2, 2);
% scatter(Pareto_Front(:, 1), Pareto_Front(:, 2), 'filled');
% xlabel('Objective 1');
% ylabel('Objective 2');
% title('Pareto Front');

% Save the Pareto front and convergence curve data if needed
%save('Pareto_Front_Data.mat', 'Pareto_Front', 'Convergence_curve');
