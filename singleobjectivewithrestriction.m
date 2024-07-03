clear all;
clc;

PD_no = 200;           % Number of sand cat
F_obj = @three_bar_truss; % Function handle for three_bar_truss function
Max_iter = 1000;       % Maximum number of iterations

% Define lower and upper bounds and dimension for three_bar_truss function
LB = [0; 0];          % Lower bounds
UB = [10; 10];        % Upper bounds
Dim = 2;              % Dimension

[Best_Score, BestFit, Convergence_curve] = MSCSO(PD_no, Max_iter, LB, UB, Dim, F_obj);  % Call MSCSO

% Compute Convergence Speed
ConvergenceSpeed = 1 / find(Convergence_curve <= Best_Score, 1);

% Compute Success Rate (Robustness)
SuccessRate = sum(Convergence_curve <= Best_Score) / numel(Convergence_curve);

% Compute Fitness Score
FitnessScore = Best_Score;

% Plotting the convergence curve as a 2D semilogy plot
figure;
semilogy(Convergence_curve, 'LineWidth', 3);  % Convergence plot
xlabel('Iteration#');
ylabel('Best fitness so far');
legend('MSCSO');
title('Convergence Curve (2D View)');

% Display Metrics
disp(['The best-obtained solution by MSCSO is : ', num2str(BestFit)]);
disp(['The best optimal value of the objective function found by MSCSO is : ', num2str(Best_Score)]);
disp(['Convergence Speed: ', num2str(ConvergenceSpeed)]);
disp(['Success Rate (Robustness): ', num2str(SuccessRate)]);
disp(['Fitness Score: ', num2str(FitnessScore)]);
