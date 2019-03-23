% Generates linear data with significant noise
function [X, Y] = ex3_generate_data(N, dim)
    if dim == 2
        % Generate 2D linear dataset
        X = 4 * randn(N, 1);
        Y = -1 * X + 4 + randn(N, 1);
        % Add significant noise
        X = [X; -10 + 20*rand(20,1)];
        Y = [Y; -10 + 20*rand(20,1)];
        % Shuffle
        new_idx = randperm(size(X, 1));
        X = X(new_idx);
        Y = Y(new_idx);
    end
    if dim == 3
        % Generate 3D linear dataset
        X1 = 0.5 * randn(N, 1);
        X2 = 0.5 * randn(N, 1);
        Y = 1 * X1 + 5 * X2 + randn(N, 1);
        % Add significant noise
        X1 = [X1; -10 + 20*rand(20,1)];
        X2 = [X2; -10 + 20*rand(20,1)];
        Y = [Y; -10 + 20*rand(20,1)];
        % Shuffle
        X = [X1, X2];
        new_idx = randperm(size(X, 1));
        X = X(new_idx,:);
        Y = Y(new_idx,:);
    end
end
