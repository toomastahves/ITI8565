close all
clear
%rng default

%[best_accuracy, k] = knn_presentation();

[X, Y] = linreg_generate_data(100, 3);
[train_data, train_labels, test_data, test_labels] = split_data(X, Y);
[slope, intercept] = linreg_mean_squares(train_data, train_labels);
linreg_plot(test_data, test_labels, slope, intercept);

% Quality test
%R2 = linreg_coefficient_of_determination(test_data, test_labels, slope, intercept)
