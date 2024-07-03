function [f, c] = CropOptimization(A)
    % Define parameters
    B = [5000, 6000]; % Net return from maize and paddy (Rs/ha)
    P_GW = 2000; % Groundwater cost (Rs/〖Mm〗^3)
    GW = rand(1, 12); % Monthly groundwater withdrawal (random values for illustration)
    LandArea = 1000; % Available land area (ha)

    % Objective function: Maximize net benefits
    f = sum(B .* A) - P_GW * sum(GW);

    % Constraints
    % 1. Total area constraint: Total area of cultivated crops should not exceed available land area
    c(1) = sum(A) - LandArea;
    
    % 2. Individual crop area constraints: Specify feasible limits for each crop
    % For example, let's assume maize and paddy should not exceed 700 ha each
    c(2) = A(1) - 700; % Maize area constraint
    c(3) = A(2) - 700; % Paddy area constraint
    
    % 3. Groundwater withdrawal constraint: Monthly groundwater withdrawal should not exceed the maximum allowable limit
    % For example, assume the maximum allowable limit is 50 Mm^3
    c(4) = sum(GW) - 50;
end

