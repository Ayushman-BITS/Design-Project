function srnmain()
    SearchAgents_no = 200;
    Max_iter = 500;
    lb = [-15, -10];
    ub = [15, 10];
    dim = 2;

    % Objective function for MSCSO_MO algorithm
    fobj = @(x) objectives_with_constraints(x);

    % Call MSCSO_MO with objective function and constraints
    [Best_Pareto_Score, Pareto_Front, Convergence_curve, Pareto_Parents] = MSCSO_MO(SearchAgents_no, Max_iter, lb, ub, dim, fobj);

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
end
% function srnmain()
%     SearchAgents_no = 200;
%     Max_iter = 500;
%     lb = [-20, -20];
%     ub = [20, 20];
%     dim = 2;
% 
%     % Objective function for MSCSO_MO algorithm with constraints
%     fobj = @(x) objectives_with_constraints(x);
% 
%     % Constraints function
%     nonlcon = @(x) constraints(x);
% 
%     % Call MSCSO_MO with objective function and constraints
%     [Best_Pareto_Score, Pareto_Front, Convergence_curve, Pareto_Parents] = MSCSO_MO(SearchAgents_no, Max_iter, lb, ub, dim, fobj, nonlcon);
% 
%     % Compute Convergence Speed
%     ConvergenceSpeed = 1 / find(Convergence_curve <= Best_Pareto_Score, 1);
% 
%     % Compute Success Rate (Robustness)
%     SuccessRate = sum(Convergence_curve <= Best_Pareto_Score) / numel(Convergence_curve);
% 
%     % Plot Pareto Front
%     figure;
%     scatter(Pareto_Front(:, 1), Pareto_Front(:, 2), 'filled');
%     title('Pareto Front (Approximation)');
%     xlabel('Objective 1');
%     ylabel('Objective 2');
%     grid on;
% 
%     % Display Metrics
%     disp(['The best-obtained Pareto front score by MSCSO_MO is : ', num2str(Best_Pareto_Score)]);  
%     disp(['Convergence Speed: ', num2str(ConvergenceSpeed)]);
%     disp(['Success Rate (Robustness): ', num2str(SuccessRate)]);
% 
%     % Display Pareto Front Values
%     disp('Pareto Front Values (Parent Front):');
%     disp(Pareto_Parents);
% end
