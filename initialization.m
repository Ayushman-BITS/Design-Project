% function [X]=initialization(N,dim,up,down)
% 
% if size(up,1)==1
%     X=rand(N,dim).*(up-down)+down;
% end
% if size(up,1)>1
%     for i=1:dim
%         high=up(i);low=down(i);
%         X(:,i)=rand(1,N).*(high-low)+low;
%     end
% end
% end
function [X] = initialization(N, dim, lb, ub)
    if dim == 1
        X = rand(N, 1) .* (ub - lb) + lb; % Initialize for one-dimensional optimization
    else
        X = rand(N, dim) .* (ub - lb) + lb; % Initialize for multi-dimensional optimization
    end
end
