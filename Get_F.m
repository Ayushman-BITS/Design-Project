function [LB,UB,Dim,F_obj] = Get_F(F)


switch F
    case 'F1'
        F_obj = @F1;
        LB=-100;
        UB=100;
        Dim=10;
        
    case 'F2'
        F_obj = @F2;
        LB=-10;
        UB=10;
        Dim=10;
        
    case 'F3'
        F_obj = @F3;
        LB=-100;
        UB=100;
        Dim=10;
        
    case 'F4'
        F_obj = @F4;
        LB=-100;
        UB=100;
        Dim=10;
        
    case 'F5'
        F_obj = @F5;
        LB=-30;
        UB=30;
        Dim=10;
        
    case 'F6'
        F_obj = @F6;
        LB=-100;
        UB=100;
        Dim=10;
        
    case 'F7'
        F_obj = @F7;
        LB=-1.28;
        UB=1.28;
        Dim=10;
        
    case 'F8'
        F_obj = @F8;
        LB=-500;
        UB=500;
        Dim=10;
        
    case 'F9'
        F_obj = @F9;
        LB=-5.12;
        UB=5.12;
        Dim=10;
        
    case 'F10'
        F_obj = @F10;
        LB=-32;
        UB=32;
        Dim=10;
        
    case 'F11'
        F_obj = @F11;
        LB=-600;
        UB=600;
        Dim=10;
        
    case 'F12'
        F_obj = @F12;
        LB=-50;
        UB=50;
        Dim=10;
        
    case 'F13'
        F_obj = @F13;
        LB=-50;
        UB=50;
        Dim=10;
        
    case 'F14'
        F_obj = @F14;
        LB=-65.536;
        UB=65.536;
        Dim=2;
        
    case 'F15'
        F_obj = @F15;
        LB=-5;
        UB=5;
        Dim=4;
        
    case 'F16'
        F_obj = @F16;
        LB=-5;
        UB=5;
        Dim=2;
        
    case 'F17'
        F_obj = @F17;
        LB=[-5,0];
        UB=[10,15];
        Dim=2;
        
    case 'F18'
        F_obj = @F18;
        LB=-2;
        UB=2;
        Dim=2;
        
    case 'F19'
        F_obj = @F19;
        LB=0;
        UB=1;
        Dim=3;
        
    case 'F20'
        F_obj = @F20;
        LB=0;
        UB=1;
        Dim=6;     
        
    case 'F21'
        F_obj = @F21;
        LB=0;
        UB=10;
        Dim=4;    
        
    case 'F22'
        F_obj = @F22;
        LB=0;
        UB=10;
        Dim=4;    
        
    case 'F23'
        F_obj = @F23;
        LB=0;
        UB=10;
        Dim=4;   
    
    case 'F24'
        F_obj = @F24;
        LB = -32;
        UB = 32;
        Dim = 30;

    case 'F25'
        F_obj = @F25;
        LB = -512;
        UB = 512;
        Dim = 2;
    case 'F26'
        F_obj = @F26;
        LB = [-3, -2]; % Lower bounds for x1 and x2
        UB = [3, 2];   % Upper bounds for x1 and x2
        Dim = 2;
    
    case 'F27'
        F_obj = @F27;
        LB = zeros(1, 3); % Lower bounds for x1, x2, x3
        UB = ones(1, 3); % Upper bounds for x1, x2, x3
        Dim = 3;  

    case 'F28'
        F_obj = @F28;
        LB = zeros(1, 6); % Lower bounds for all dimensions
        UB = ones(1, 6);  % Upper bounds for all dimensions
        Dim = 6;

    case 'F29'
        F_obj = @F29;
        LB = zeros(1, 4); % Lower bounds for all dimensions
        UB = [10, 10, 10, 10];  % Upper bounds for all dimensions
        Dim = 4;    
    case 'F30'
        F_obj = @F30;
        LB = zeros(1, 2); % Lower bounds for all dimensions
        UB = ones(1,2);  % Upper bounds for all dimensions
        Dim = 2; 
    
    case 'F31'
        F_obj = @F31;
        LB = [0.2, -2.22554, 0]; % Lower bounds for x1, x2, x3
        UB = [1, 1, 1];  % Upper bounds for x1, x2, x3
        Dim = 3;    
    
    case 'F32'
        F_obj = @F32; % Objective function handle
        % Define lower and upper bounds for water release in each period (Q)
        LB = [100, 150, 200, 180, 160, 140, 120, 100, 90, 80, 70, 60]; % Example lower bounds for each month
        UB = [300, 350, 400, 380, 360, 340, 320, 300, 290, 280, 270, 260]; % Example upper bounds for each month

        Dim = 12; % Dimensionality of the problem (number of decision variables)

   
end

end

% F1

function o = F1(x)
o=sum(x.^2);
end

% F2

function o = F2(x)
o=sum(abs(x))+prod(abs(x));
end

% F3

function o = F3(x)
dim=size(x,2);
o=0;
for i=1:dim
    o=o+sum(x(1:i))^2;
end
end

% F4

function o = F4(x)
o=max(abs(x));
end

% F5

function o = F5(x)
dim=size(x,2);
o=sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);
end

% F6

function o = F6(x)
o=sum(abs((x+.5)).^2);
end

% F7

function o = F7(x)
dim=size(x,2);
o=sum(1:dim.*(x.^4))+rand;
end

% F8

function o = F8(x)
o=sum(-x.*sin(sqrt(abs(x))));
end

% F9

function o = F9(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi.*x))+10*dim;
end

% F10

function o = F10(x)
dim=size(x,2);
o=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
end

% F11

function o = F11(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

% F12

function o = F12(x)
dim=size(x,2);
o=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
(1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% F13

function o = F13(x)
dim=size(x,2);
o=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% F14

function o = F14(x)
aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;,...
-32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];

for j=1:25
    bS(j)=sum((x'-aS(:,j)).^6);
end
o=(1/500+sum(1./([1:25]+bS))).^(-1);
end

% F15

function o = F15(x)
aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
o=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
end

% F16

function o = F16(x)
o=4*(x(1)^2)-2.1*(x(1)^4)+(x(1)^6)/3+x(1)*x(2)-4*(x(2)^2)+4*(x(2)^4);
end

% F17

function o = F17(x)
o=(x(2)-(x(1)^2)*5.1/(4*(pi^2))+5/pi*x(1)-6)^2+10*(1-1/(8*pi))*cos(x(1))+10;
end

% F18

function o = F18(x)
o=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
    (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end

% F19

function o = F19(x)
aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F20

function o = F20(x)
aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
.2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F21

function o = F21(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

o=0;
for i=1:5
    o=o-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% F22

function o = F22(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

o=0;
for i=1:7
    o=o-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% F23

function o = F23(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

o=0;
for i=1:10
    o=o-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end

% F24 Ackley's Function
function o = F24(x)
    % Define your F24 function here
    n = numel(x);
    sum_x_squared = sum(x.^2);
    sum_cos_2pi_x = sum(cos(2*pi*x));
    o = -20 * exp(-0.2 * sqrt(1/n * sum_x_squared)) - exp(1/n * sum_cos_2pi_x) + 20 + exp(1);
end

% F25 EggHolder Function
function o = F25(x)
    x1 = x(1);
    x2 = x(2);
    
    term1 = -(x2 + 47) * sin(sqrt(abs(x2 + x1/2 + 47)));
    term2 = -x1 * sin(sqrt(abs(x1 - (x2 + 47))));
    
    o = term1 + term2;
end
% F26 Six Hump Camel Back Function
function o = F26(x)
    x1 = x(1);
    x2 = x(2);

    if x1 < -3 || x1 > 3 || x2 < -2 || x2 > 2
        o = NaN; % Return NaN for out-of-range inputs
        return;
    end

    term1 = (4 - 2.1 * x1^2 + x1^4 / 3) * x1^2;
    term2 = x1 * x2;
    term3 = (-4 + 4 * x2^2) * x2^2;

    o = term1 + term2 + term3;
end
% F27  Hartman 3D***
function o = F27(x)
    % Constants
    c = [1.0, 1.2, 3.0, 3.2]';
    a = [3.0, 10, 30; 0.1, 10, 35; 3.0, 10, 30; 0.1, 10, 35];
    p = [3689, 1170, 2673; 4699, 4387, 7470; 1091, 8732, 5547; 381, 5743, 8828];

    % Compute the function value
    inner_sum = 0;
    for i = 1:4
        temp_sum = 0;
        for j = 1:3
            temp_sum = temp_sum + a(i, j) * ((x(j) - p(i, j))^2);
        end
        inner_sum = inner_sum - c(i) * exp(-temp_sum);
    end
    o = inner_sum;
end

% F28  Hartman 6D***
function o = F28(x)
    % Check if input vector x has six elements
    if numel(x) ~= 6
        error('Input vector x must have six elements.');
    end
    
    % Define the constants c, a, and p
    c = [1.0; 1.2; 3.0; 3.2];
    a = [10, 3, 17, 3.5, 1.7, 8;
         0.05, 10, 17, 0.1, 8, 14;
         3, 3.5, 1.7, 10, 17, 8;
         17, 8, 0.05, 10, 0.1, 14];
    p = 10^(-4) * [1312, 1696, 5569, 124, 8283, 5586;
                   2329, 4135, 8307, 3736, 1004, 9991;
                   2348, 1451, 3522, 2883, 3047, 6650;
                   4047, 8828, 8732, 5743, 1091, 381];
    
    % Initialize result to 0
    o = 0;
    
    % Compute the function value
    for i = 1:size(c, 1)
        inner_sum = 0;
        for j = 1:size(a, 2)
            inner_sum = inner_sum + a(i, j) * (x(j) - p(i, j))^2;
        end
        o = o - c(i) * exp(-inner_sum);
    end
end
% Shekel function
function result = F29(x)
    % Define constants
    m = 10;
    beta = (1/10) * [1, 2, 2, 4, 4, 6, 3, 7, 5, 5]';
    C = [4, 1, 8, 6, 3, 2, 5, 8, 6, 7;
         4, 1, 8, 6, 7, 9, 3, 1, 2, 3.6;
         4, 1, 8, 6, 3, 2, 5, 8, 6, 7;
         4, 1, 8, 6, 7, 9, 3, 1, 2, 3.6];

    % Check if the size of x is exactly 4
    if numel(x) ~= 4
        error('Input vector x must have exactly 4 elements.');
    end
    
    % Check if x is within the specified range
    if any(x < 0) || any(x > 10)
        error('Input vector x must be within the range [0, 10].');
    end
    
    % Initialize result
    result = 0;
    
    % Compute the function value
    for i = 1:m
        inner_sum = 0;
        for j = 1:4
            inner_sum = inner_sum + (x(j) - C(j, i))^2;
        end
        result = result + (inner_sum + beta(i))^-1;
    end
end
%three_bar_truss
% F30

function f = F30(x)
    % Constants
    P = 2; % KN/cm^2
    r = 2; % kN/cm^2
    l = 100; % cm

    % Check box constraints
    if any(x < 0) || any(x > 1)
        f = NaN; % Return NaN for out-of-range inputs
        return;
    end

    % Objective function
    f = 2 * sqrt(2) * x(1) + x(2) * l;

    % Inequality constraints
    g(1) = ((sqrt(2) * x(1) + x(2)) / (sqrt(2) * x(1)^2 + 2 * x(1) * x(2))) * P - r;
    g(2) = (x(2) * P) / (x(1) + (sqrt(2) * x(2))) - r;
    g(3) = (P / (x(1) + (sqrt(2) * x(2)))) - r;

    % Nonlinear inequality constraints
    g = g(:); % Ensure column vector for constraints

    % Check if any inequality constraint is violated
    if any(g > 0)
        % Penalize the objective function if constraints are violated
        f = f + 1e6 * sum(max(0, g).^2); % Penalization term
    end
end
%process sheet flow 
function f = F31(x)
    % Check box constraints
    if x(1) < 0.2 || x(1) > 1 || x(2) < -2.22554 || x(2) > 1 || ~ismember(x(3), [0, 1])
        f = NaN; % Return NaN for out-of-range inputs
        return;
    end

    % Objective function
    f = -0.7 * x(3) + 5 * (0.5 - x(1))^2 + 0.8;

    % Inequality constraints
    g(1) = -exp(x(1) - 0.2) - x(2);
    g(2) = x(2) + 1.1 * x(3) + 1;
    g(3) = x(1) - x(3) - 0.2;

    % Check if any inequality constraint is violated
    if any(g > 0)
        % Penalize the objective function if constraints are violated
        f = f + 1e3 * sum(max(0, g).^2); % Penalization term
    end
end

%hydro power generation
function f = F32(Q)
    % Define parameters
    gamma = 0.8; % Efficiency of the hydropower plant
    alpha = 112; % Output factor of power generation
    Vi = 1000; % Reservoir water storage at the beginning of ith period (example value)
    Smin = 800; % Minimum allowable reservoir water level
    Smax = 1200; % Maximum allowable reservoir water level
    
    % Define functions for upstream head, downstream head, and head loss
    Zup = @(Qi, Ii) 78.65 + sqrt(23.288 * (Vi + (Ii - Qi))) + 127.225;
    Zdown = @(Qi) 62.57917 + 9.84891e-5 * Qi + 1.42007e-9 * Qi^2;
    Zloss = @(Ii) 1e-4 * Ii;
    
    % Define water inflow, extraction, and overflow in each period
    I = [100, 120, 110, 90, 95, 105, 130, 140, 135, 125, 110, 105]; % Water inflow in each period
    E = [30, 35, 40, 25, 20, 35, 45, 50, 30, 40, 35, 30]; % Water extraction in each period
    Ovft = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; % Overflow in each period (assuming no overflow initially)
    
    % Check if Q is valid
    if ~isvector(Q) || length(Q) ~= 12
        error('Input Q must be a vector of length 12 representing water release in each period.');
    end
    
    % Calculate hydropower generation for each period
    Hydropower = zeros(1, 12);
    ReservoirWaterLevel = Vi;
    for i = 1:12
        Hi = Zup(Q(i), I(i)) - Zdown(Q(i)) - Zloss(I(i));
        Hydropower(i) = gamma * alpha * Q(i) * Hi;
        
        % Update reservoir water level
        ReservoirWaterLevel = ReservoirWaterLevel + I(i) - E(i) - Ovft(i);
        
        % Check reservoir water level constraints
        if ReservoirWaterLevel < Smin || ReservoirWaterLevel > Smax
            % Penalize the objective function heavily for violating constraints
            f = -sum(Hydropower) - 1e6;
            return;
        end
    end
    
    % Objective function: maximize hydropower generation
    f = -sum(Hydropower);
end







