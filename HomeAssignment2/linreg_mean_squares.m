% Mean squares method
function [slope, intercept] = linreg_mean_squares(X, Y)
    slope = pinv(X' *  X) * X' * Y;
    intercept = sum(mean(Y) - slope .* mean(X)');
end
