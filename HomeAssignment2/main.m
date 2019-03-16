close all
clear
%rng default

%[best_accuracy, k] = knn_presentation();

[X, Y] = linreg_generate_data(100, 2);
%[slope, intercept] = linreg_mean_squares(X, Y);
%linreg_plot(X, Y, slope, intercept);

%[history_slope, history_intercept, history_cost] = gd_calculate(X, Y, 100, 0.1);
%gd_plot(X, Y, history_slope, history_intercept);
