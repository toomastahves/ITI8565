% Gradient descent method for calculating slope and intercept of line
function [history_slope, history_intercept, history_cost] = gd_calculate(X, Y, max_steps, rate)
    current_slope = 0;
    current_intercept = 0;
    history_slope = zeros(max_steps, 1);
    history_intercept = zeros(max_steps, 1);
    history_cost = zeros(max_steps, 1);
    % Calculating slope, intercept and cost on each step
    for i=1:max_steps
        history_slope(i,:) = current_slope;
        history_intercept(i,:) = current_intercept;
        history_cost(i) = sum((Y - (current_slope * X + current_intercept)).^2) / size(Y, 1);
        [current_slope, current_intercept] = gd_step(X, Y, current_slope, current_intercept, rate);
    end
end

% Single step to calculate slope and intercept
function [slope, intercept] = gd_step(X, Y, slope, intercept, rate)
    N = size(Y, 1);
    Y_hat = slope .* X + intercept;
    % Error function to be minimized
    error = (Y - Y_hat) / N;
    % Calculating new values
    slope = slope - (rate * sum(-X .* error));
    intercept = intercept - (rate * sum(-1 .* error));
end
