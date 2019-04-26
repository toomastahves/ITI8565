% Gradient boosting algorithm
function [error_history, y_hat] = ex2_gradient_boosting(X, Y, epochs)
    Y_temp = Y;
    N = size(Y_temp, 1);
    y_hat = zeros(N, 1);
    error_history = zeros(epochs, 1);
    % Training model
    for i=1:epochs
        % Creating stump
        stump = fitrtree(X,Y_temp,'minparent',size(X,1),'prune','off','mergeleaves','off');
        % Splitting data in two parts
        cut_point = stump.CutPoint(1);
        left_idx = find(X <= cut_point);
        right_idx = find(X > cut_point);
        % Calculating residuals for each part
        residuals = zeros(N, 1);
        residuals(left_idx) = mean(Y_temp(left_idx));
        residuals(right_idx) = mean(Y_temp(right_idx));
        % Predicting new Y value
        y_hat = y_hat + residuals;
        error = Y - y_hat;
        Y_temp = error;
        % Saving error for plotting
        error_history(i,:) = sum(abs(error));
    end
end
