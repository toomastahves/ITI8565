% Returns distance between point1 and point2
function dist = ex1_distance_minkowski(point1, point2, p)
    if p == Inf
        % Chebyshev distance
        dist = max(abs(point1 - point2));
    else
        % Minkowski distance
        dist = sum(abs(point1 - point2).^p)^(1/p);
    end
    % Shorter solution, but very slow
    %syms p;
    %dist = double(limit(sum(abs(point1 - point2).^px)^(1/px), px, p));
end
