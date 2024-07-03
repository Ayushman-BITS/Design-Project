function [Best_Pareto_Score, Pareto_Front, Convergence_curve, Pareto_Parents] = MSCSO_MO(SearchAgents_no, Max_iter, lb, ub, dim, fobj)
    % Initialization
    Best_Pareto_Score = inf; % Best Pareto front score
    Pareto_Front = []; % Initialize Pareto front
    Positions = initialization(SearchAgents_no, dim, ub, lb); % Initialize positions
    Convergence_curve = zeros(1, Max_iter); % Convergence curve

    % Initialize BestFit array for each objective with the same size as Positions
    BestFit = inf(SearchAgents_no, 2); % Multi-objective, so 2 objectives

    % Preallocate newX and Pareto_Parents
    newX = zeros(SearchAgents_no, dim);
    Pareto_Parents = zeros(SearchAgents_no, dim);

    % Main loop
    for t = 1:Max_iter
        % Evaluate fitness for each solution
        fitness = zeros(SearchAgents_no, 2); % Multi-objective, so 2 objectives
        for i = 1:SearchAgents_no
            fitness(i, :) = fobj(Positions(i, :));
        end

        % Update Pareto front (approximation)
        Pareto_Front = approximate_pareto_front(Pareto_Front, fitness);

        % Update best Pareto front score
        Best_Pareto_Score = min(Best_Pareto_Score, min(fitness(:, 1)));

        % Update BestFit for each objective
        BestFit = min(BestFit, fitness);

        % LOBL strategy and position update (similar to MSCSO)
        k = (1 + (t / Max_iter)^0.5)^10;
        for i = 1:SearchAgents_no
            Xnew = (ub + lb) / 2 + (ub - lb) / (2 * k) - Positions(i, :) / k;
            flag4ub = Xnew > ub;
            flag4lb = Xnew < lb;
            Xnew = (Xnew .* (~(flag4ub + flag4lb))) + lb .* flag4lb + ub .* flag4ub;
            if all(fobj(Xnew) < fobj(Positions(i, :)))
                Positions(i, :) = Xnew;
                fitness(i, :) = fobj(Xnew);
            end
        end

        % Levy Flight and Roulette Wheel Selection (similar to MSCSO)
        S = 2; % Maximum Sensitivity range
        RL = levy_func(SearchAgents_no, dim, 1.5); % Levy Flight
        p = 1:360; % Angle for roulette wheel selection

        % Update positions using Levy Flight and Roulette Wheel Selection
        for i = 1:SearchAgents_no
            rg = S - ((S) * t / (Max_iter)); % Guides R
            r = rand * rg;
            R = ((2 * rg) * rand) - rg; % Controls transition phases
            for j = 1:dim
                if j <= size(BestFit, 2) && j <= size(Positions, 2) % Check array bounds
                    teta = RouletteWheelSelection_SCSO(p);
                    if -1 <= R && R <= 1 % R value is between -1 and 1
                        % Attacking on the prey
                        Rand_position = abs(rand * BestFit(i, j) - Positions(i, j));
                        Positions(i, j) = BestFit(i, j) - r * Rand_position * cos(teta);
                        % Levy Flight Walk Strategy
                        L = BestFit(i, j) - Positions(i, j);
                        newX(i, j) = BestFit(i, j) + L * RL(i, j);
                    else
                        % Search for prey
                        cp = floor(SearchAgents_no * rand() + 1);
                        CandidatePosition = Positions(cp, :);
                        Positions(i, j) = r * (CandidatePosition(j) - rand * Positions(i, j));
                        % Triangle walk strategy
                        L = BestFit(i, j) - Positions(i, j);
                        LP = L * rand;
                        alph = L * L + LP * LP - 2 * LP * L * cos(2 * pi * rand);
                        newX(i, j) = BestFit(i, j) + r * alph;
                    end
                end
            end

            % Handle boundary constraints
            Flag4ub = Positions(i, :) > ub; % Check if they exceed (up) the boundaries
            Flag4lb = Positions(i, :) < lb; % Check if they exceed (down) the boundaries
            Positions(i, :) = (Positions(i, :) .* (~(Flag4ub + Flag4lb))) + ub .* Flag4ub + lb .* Flag4lb;
            fitnessnew1 = fobj(Positions(i, :));

            Flag4ub = newX(i, :) > ub; % Check if they exceed (up) the boundaries
            Flag4lb = newX(i, :) < lb; % Check if they exceed (down) the boundaries
            newX(i, :) = (newX(i, :) .* (~(Flag4ub + Flag4lb))) + ub .* Flag4ub + lb .* Flag4lb;
            fitnessnew2 = fobj(newX(i, :));
            if all(fitnessnew2 < fitnessnew1)
                Positions(i, :) = newX(i, :);
            end

            % Update Pareto Parents
            Pareto_Parents(i, :) = Positions(i, :);
        end

        % Update convergence curve
        Convergence_curve(t) = Best_Pareto_Score;

        % Debugging outputs for x1 and x2
        disp(['Iteration: ', num2str(t)]);
        disp(['x1 values: ', num2str(Positions(:, 1)')]);
        disp(['x2 values: ', num2str(Positions(:, 2)')]);
    end
end

% Helper function to approximate Pareto front
function Pareto_Front = approximate_pareto_front(existing_front, new_fitness)
    combined = [existing_front; new_fitness];
    [~, unique_indices, ~] = unique(combined(:, 1));
    Pareto_Front = combined(unique_indices, :);
end

