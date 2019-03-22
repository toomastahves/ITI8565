% Generates linear data without significant noise
function [X, Y] = gd_generate_data(N)
    % Generate 2D linear dataset
    X = 2 * randn(N, 1);
    Y = 3 * X + 2 + randn(N, 1);
end