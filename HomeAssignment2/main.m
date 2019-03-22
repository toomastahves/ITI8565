close all
clear
%rng default

%[best_accuracy, k] = knn_main();

%dimensions = 2;
%[X, Y] = linreg_generate_data(100, dimensions);
%max_iterations = 20;
%alpha = 0.02;
%R_squared_limit = 0.9;
%[corr_matrix] = linreg_main(X, Y, max_iterations, R_squared_limit, alpha);

%[X, Y] = gd_generate_data(100);
%[history_slope, history_intercept, history_cost] = gd_calculate(X, Y, 100, 0.005);
%gd_plot(X, Y, history_slope, history_intercept);
