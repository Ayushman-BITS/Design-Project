clear all;
clc;

PD_no = 100;        % Number of sand cat
F_name = 'F28';     % Name of the test function
Max_iter = 500;     % Maximum number of iterations

[LB, UB, Dim, F_obj] = Get_F(F_name);  % Get details of the benchmark functions
[Pareto_Front, Best_Pareto_Score, PDConv] = MSCSO_MO(PD_no, Max_iter, LB, UB, Dim, F_obj);  % Call modified MSCSO for multi-objective optimization

% Compute Convergence Speed
ConvergenceSpeed = 1 / find(PDConv <= Best_Pareto_Score, 1);

% Display Metrics
disp(['Number of Pareto Front solutions: ', num2str(size(Pareto_Front, 1))]);
disp(['The best optimal value of the Pareto Front found by MSCSO is : ', num2str(Best_Pareto_Score)]);
disp(['Convergence Speed: ', num2str(ConvergenceSpeed)]);
