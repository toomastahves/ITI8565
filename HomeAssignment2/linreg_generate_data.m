% Generates linear data with normally distributed noise
function [X, Y] = linreg_generate_data(N, dim)
    if dim == 2
        X = 0.5 * randn(N, 1);
        Y = -2 * X + 4 + randn(N, 1);
    end
    if dim == 3
        X1 = 0.5 * randn(N, 1);
        X2 = 0.5 * randn(N, 1);
        X = [X1, X2];
        Y = 2 * X1 + 5 * X2 + randn(N, 1);
    end
end
