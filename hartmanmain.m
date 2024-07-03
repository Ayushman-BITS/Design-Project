clear all;
clc;

PD_no = 200;        % Number of sand cat
F_name = 'F27';     % Name of the test function
Max_iter = 1000;     % Maximum number of iterations

[LB, UB, Dim, F_obj] = Get_F(F_name);  % Get details of the benchmark functions
[Best_PD, PDBest_P, PDConv] = MSCSO(PD_no, Max_iter, LB, UB, Dim, F_obj);  % Call MSCSO

% Compute Convergence Speed
ConvergenceSpeed = 1 / find(PDConv <= Best_PD, 1);

% Compute Success Rate (Robustness)
SuccessRate = sum(PDConv <= Best_PD) / numel(PDConv);

% Compute Fitness Score
FitnessScore = Best_PD;

% Plotting the convergence curve as a 3D surface plot
% plotConvergence3D(PDConv, PDBest_P);

% Plotting the convergence curve as a 2D semilogy plot
figure;
semilogy(PDConv, 'LineWidth', 3);  % Convergence plot
xlabel('Iteration#');
ylabel('Best fitness so far');
legend('MSCSO');
title('Convergence Curve (2D View)');

% Display Metrics
disp(['The best-obtained solution by MSCSO is : ', num2str(PDBest_P)]);
disp(['The best optimal value of the objective function found by MSCSO is : ', num2str(Best_PD)]);
disp(['Convergence Speed: ', num2str(ConvergenceSpeed)]);
disp(['Success Rate (Robustness): ', num2str(SuccessRate)]);
disp(['Fitness Score: ', num2str(FitnessScore)]);

% function plotConvergence3D(PDConv, PDBest_P)
%     % Compute the number of iterations
%     numIterations = numel(PDConv);
% 
%     % Create a meshgrid for iterations and fitness values
%     [X, Y] = meshgrid(1:numIterations, 1:PDBest_P);
% 
%     % Create the Z matrix for the surface plot
%     Z = zeros(size(X));
%     for i = 1:size(X, 1)
%         for j = 1:size(X, 2)
%             Z(i, j) = PDConv(X(i, j));
%         end
%     end
% 
%     % Plot the 3D surface
%     figure;
%     surf(X, Y, Z);
%     xlabel('Iteration');
%     ylabel('Best fitness so far');
%     zlabel('Fitness value');
%     title('Convergence Curve (3D View)');
%     view(45, 30);  % Adjust the view angle for better visibility
% end

