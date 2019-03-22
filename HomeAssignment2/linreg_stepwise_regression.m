% Stepwise regression
function [R_squared_performance, X, Y, slope, intercept] = linreg_stepwise_regression(X, Y, iterations, R_squared_limit, alpha)
    for i=1:iterations
        % F-test
        [idx] = linreg_f_test(X, Y, alpha);
        % Selecting passed test points
        X = X(idx == 0,:);
        Y = Y(idx == 0,:);
        % Calculating R^2
        [slope, intercept] = linreg_mean_squares(X, Y);
        R_squared = linreg_R_squared(X, Y, slope, intercept);
        % Used for tracking learning rate
        R_squared_performance(i,:) = [i, R_squared];
        % Loop end condition
        if R_squared > R_squared_limit
            break
        end
    end
end
