% Calculates coefficient of determination. Used for quality test.
function R_squared = linreg_coefficient_of_determination(X, Y, slope, intercept) 
    % Total sum of squares
    SS_tot = sum((Y - mean(Y)).^2);
    % Predicted Y value
    Y_hat = (intercept + sum(slope .* X', 1))';
    % Residual sum of squares
    SS_res = sum((Y - Y_hat).^2);
    % Regression sum of squares = explained sum of squares
    SS_reg = sum((Y_hat - mean(Y)).^2);
    % R^2
    R_squared = 1 - SS_res / SS_tot;
end
