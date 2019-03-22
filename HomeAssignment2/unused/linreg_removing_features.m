% Removing features that have correlation coefficients above threshold
function [X, corr_matrix] = linreg_removing_features(X, threshold)
    % Calculating correlation coefficients
    corr_matrix = linreg_correlation_coefficients(X);
    % Calculating column indexes that are above threshold
    indexes = corr_matrix(1,:) > threshold;
    % Removing columns in coefficients array
    corr_matrix(:,~indexes) = [];
    % Removing columns in data array too before returning
    X(:,~indexes) = [];
    % Calculating row indexes that are above threshold
    indexes = corr_matrix(:,1) > threshold;
    % Removing rows in coefficients array
    corr_matrix(~indexes,:) = [];
end
