clear all
clc

PD_no = 200;        % Number of sand cat
Max_iter = 500;     % Maximum number of iterations

% Define Lower Bound (LB) and Upper Bound (UB) for ZDT1/ZDT2
LB = zeros(1, 30);
UB = ones(1, 30);

% Call MSCSO_MO with ZDT1 as the objective function
[Best_Pareto_Score, Pareto_Front, Convergence_curve, Pareto_Parents] = MSCSO_MO(PD_no, Max_iter, LB, UB, numel(LB), @ZDT2);  % Call MSCSO_MO with ZDT1

% Compute Convergence Speed
ConvergenceSpeed = 1 / find(Convergence_curve <= Best_Pareto_Score, 1);

% Compute Success Rate (Robustness)
SuccessRate = sum(Convergence_curve <= Best_Pareto_Score) / numel(Convergence_curve);

% Plot Pareto Front
figure;
scatter(Pareto_Front(:, 1), Pareto_Front(:, 2), 'filled');
title('Pareto Front (Approximation)');
xlabel('Objective 1');
ylabel('Objective 2');
grid on;

% Display Metrics
disp(['The best-obtained Pareto front score by MSCSO_MO is : ', num2str(Best_Pareto_Score)]);  
disp(['Convergence Speed: ', num2str(ConvergenceSpeed)]);
disp(['Success Rate (Robustness): ', num2str(SuccessRate)]);

% Display Pareto Front Values
disp('Pareto Front Values (Parent Front):');
disp(Pareto_Parents);

