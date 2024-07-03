function ParetoOptimalSet = get_pareto_optimal_set(PDConv)
    ParetoOptimalSet = [];
    for i = 1:numel(PDConv)
        is_dominated = false;
        for j = 1:numel(PDConv)
            if i ~= j && all(PDConv(j, :) <= PDConv(i, :)) && any(PDConv(j, :) < PDConv(i, :))
                is_dominated = true;
                break;
            end
        end
        if ~is_dominated
            ParetoOptimalSet = [ParetoOptimalSet; PDConv(i, :)];
        end
    end
end
