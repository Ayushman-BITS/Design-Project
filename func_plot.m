function func_plot(func_name)
    if strcmp(func_name, 'F28')
        error('Function F28 is a multi-objective function and cannot be plotted in 3D.');
    end
    x = []; % Initialize x as an empty array
    y = []; % Initialize y as an empty array

    [LB, UB, Dim, F_obj] = Get_F(func_name);

    switch func_name
        % Cases for all functions
        case 'F1'
            x = -100:2:100; y = x; %[-100,100]
        case 'F2'
            x = -100:2:100; y = x; %[-10,10]
        case 'F3'
            x = -100:2:100; y = x; %[-100,100]
        case 'F4'
            x = -100:2:100; y = x; %[-100,100]
        case 'F5'
            x = -200:2:200; y = x; %[-5,5]
        case 'F6'
            x = -100:2:100; y = x; %[-100,100]
        case 'F7'
            x = -1:0.03:1; y = x; %[-1,1]
        case 'F8'
            x = -500:10:500; y = x; %[-500,500]
        case 'F9'
            x = -5:0.1:5; y = x; %[-5,5]    
        case 'F10'
            x = -20:0.5:20; y = x; %[-500,500]
        case 'F11'
            x = -500:10:500; y = x; %[-0.5,0.5]
        case 'F12'
            x = -10:0.1:10; y = x; %[-pi,pi]
        case 'F13'
            x = -5:0.08:5; y = x; %[-3,1]
        case 'F14'
            x = -100:2:100; y = x; %[-100,100]
        case 'F15'
            x = -5:0.1:5; y = x; %[-5,5]
        case 'F16'
            x = -1:0.01:1; y = x; %[-5,5]
        case 'F17'
            x = -5:0.1:5; y = x; %[-5,5]
        case 'F18'
            x = -5:0.06:5; y = x; %[-5,5]
        case 'F19'
            x = -5:0.1:5; y = x; %[-5,5]
        case 'F20'
            x = -5:0.1:5; y = x; %[-5,5]        
        case 'F21'
            x = -5:0.1:5; y = x; %[-5,5]
        case 'F22'
            x = -5:0.1:5; y = x; %[-5,5]     
        case 'F23'
            x = -5:0.1:5; y = x; %[-5,5]  
        case 'F24'
            x = -32:0.1:32; y = x; %[-32,32] with dimension 30
        case 'F25'
            x = -512:5:512; y = x;
        case 'F26'
            x1 = -3:0.1:3;
            x2 = -2:0.1:2;
            [x, y] = meshgrid(x1, x2);
            f = zeros(size(x));  % Initialize f with zeros
            for i = 1:numel(x)
                if x(i) < -3 || x(i) > 3 || y(i) < -2 || y(i) > 2
                    f(i) = NaN;  % Assign NaN for out-of-range points
                else
                    f(i) = F_obj([x(i), y(i)]);
                end
            end
            surfc(x, y, f, 'LineStyle', 'none');
            return;  % Exit the function after plotting for F26
        case 'F27'
            x1 = 0:0.1:1;
            x2 = 0:0.1:1;
            [X, Y] = meshgrid(x1, x2);
            Z = zeros(size(X));
            for i = 1:numel(X)
                Z(i) = F_obj([X(i), Y(i), 0.5]); % Calculate z for each point
            end
            surfc(X, Y, Z, 'LineStyle', 'none');
            xlabel('x1');
            ylabel('x2');
            zlabel('Function Value');
            title('Hartmann 3D Function');
            colorbar;
            shading interp;
            colormap jet;
            return;  % Exit the function after plotting for F27
        
    end

    if isempty(x) || isempty(y)
        error('Function not supported for plotting.');
    end

    L = length(x);
    f = zeros(L);

    for i = 1:L
        for j = 1:L
            if strcmp(func_name, 'F15') == 0 && strcmp(func_name, 'F19') == 0 && ...
               strcmp(func_name, 'F20') == 0 && strcmp(func_name, 'F21') == 0 && ...
               strcmp(func_name, 'F22') == 0 && strcmp(func_name, 'F23') == 0
                f(i, j) = F_obj([x(i), y(j)]);
            end
            if strcmp(func_name, 'F15') == 1
                f(i, j) = F_obj([x(i), y(j), 0, 0]);
            end
            if strcmp(func_name, 'F19') == 1
                f(i, j) = F_obj([x(i), y(j), 0]);
            end
            if strcmp(func_name, 'F20') == 1
                f(i, j) = F_obj([x(i), y(j), 0, 0, 0, 0]);
            end
            if strcmp(func_name, 'F21') == 1 || strcmp(func_name, 'F22') == 1 || ...
               strcmp(func_name, 'F23') == 1
                f(i, j) = F_obj([x(i), y(j), 0, 0]);
            end
        end
    end

    surfc(x, y, f, 'LineStyle', 'none');
end
