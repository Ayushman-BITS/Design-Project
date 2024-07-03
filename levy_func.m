function Levy = levy_func(n, m, beta)
    sigma = calculate_sigma(beta);
    v = random('Normal', 0, 1, n, m); % random numbers drawn from normal distribution with mean 0 and standard deviation 1
    Levy = sigma * v;
end

function sigma = calculate_sigma(beta)
    u = rand(); % random number uniformly distributed between 0 and 1
    sigma = (gamma(1 + beta) * sin(pi * beta * 0.5) / gamma((beta + 1) * 0.5)) * u^(1 / (beta - 1));
end

