clear all 
clc

PD_no = 200;        % Number of sand cat
F_name = 'F32';     % Name of the test function
Max_iter = 1000;     % Maximum number of iterations

[LB, UB, Dim, F_obj] = Get_F(F_name);  % Get details of the benchmark functions
[Best_PD, PDBest_P, PDConv] = MSCSO(PD_no, Max_iter, LB, UB, Dim, F_obj);  % Call MSCSO


% Compute Convergence Speed
ConvergenceSpeed = 1 / find(PDConv <= Best_PD, 1);

% Compute Success Rate (Robustness)
SuccessRate = sum(PDConv <= Best_PD) / numel(PDConv);

% Compute Fitness Score
FitnessScore = Best_PD;

% Plotting
% figure('Position', [454   400   694   297]);
% subplot(1,2,1);
% func_plot(F_name);  % Function plot
% title('Parameter space')
% xlabel('x_1');
% ylabel('x_2');
% zlabel([F_name, '( x_1 , x_2 )'])

subplot(1,2,2);
semilogy(PDConv, 'LineWidth', 3);  % Convergence plot
xlabel('Iteration#');
ylabel('Best fitness so far');
legend('MSCSO');

% Display Metrics
display(['The best-obtained solution by MSCSO is : ', num2str(PDBest_P)]);  
display(['The best optimal value of the objective function found by MSCSO is : ', num2str(Best_PD)]);
display(['Convergence Speed: ', num2str(ConvergenceSpeed)]);
display(['Success Rate (Robustness): ', num2str(SuccessRate)]);
display(['Fitness Score: ', num2str(FitnessScore)]);
