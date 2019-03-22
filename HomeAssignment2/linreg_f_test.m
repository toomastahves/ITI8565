% Returns array, where 0 - passed test, 1 - failed test
function [idx] = linreg_f_test(X, Y, alpha)
    N = size(X, 1);
    % Iterating over N points and returning 'passed'/'not passed' for each point 
    idx = arrayfun(@(x) sum(get_Ftest(X, Y, x, alpha)), (1:N)');
end

% F-test implementation
function F_result = get_Ftest(X_combined, Y_combined, idx, alpha)
    % Remove i-th point from combined array
    X_simple = X_combined(setdiff(1:end, idx), :);
    Y_simple = Y_combined(setdiff(1:end, idx), :);
    % Calculate residual sum of squares
    RSS1 = get_RSS(X_simple, Y_simple);
    RSS2 = get_RSS(X_combined, Y_combined);
    % Calculate F score and compare to distribution F score
    F_calculated = ((RSS2 - RSS1)/2) / (RSS2/1);
    F_distribution = finv(alpha, 2, 1);
    % Return result, 0 - passed test, 1 - failed test
    F_result = F_calculated > F_distribution;
end

% Calculating residual sum of squares
function RSS = get_RSS(X, Y)
    [slope, intercept] = linreg_mean_squares(X, Y);
    Y_hat = (intercept + sum(slope .* X', 1))';
    RSS = sum((Y - Y_hat).^2);
end
