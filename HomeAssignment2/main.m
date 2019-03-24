close all
clear
%rng default

% Ex 1
% Generate dataset N = 100 points in each cluster.Total 4 * 100 = 400 points.
N = 100;
% Specify number of dimensions, 2 or 3.
dim = 2;
[points, labels] = ex1_generate_data(N, dim);
% Split data into train and test set
[train_data, train_labels, test_data, test_labels] = ex1_split_data(points, labels);
% Find best k and best distance parameter (for Minkowski function)
[best_accuracy, best_k, best_distance_parameter] = ex1_find_best_k(train_data, train_labels, test_data, test_labels);
% Predict labels
predicted_labels = ex1_knn_classifier(train_data, train_labels, test_data, best_k, best_distance_parameter);
% Plot data and predicted labels
ex1_plot(train_data, train_labels, test_data, test_labels, predicted_labels);


% Ex 2
% Get decision tree data
[X, Y, column_names] = ex2_get_dataset(3);
% Run decision tree algorithm. Returns root struct with children up to 4 levels
root = ex2_decision_tree(X, Y, column_names);


% Ex 3
% Defining dimension for data generations. Supports 2 and 3 dimensions.
dimensions = 3;
% Generates data for linear regression
[X, Y] = ex3_generate_data(100, dimensions);
% Max iterations for stepwise regression
max_iterations = 20;
% Alpha for F-test
alpha = 0.02;
% R^2 minimum value
R_squared_limit = 0.9;
% Run stepwise regression
[corr_matrix] = ex3_main(X, Y, max_iterations, R_squared_limit, alpha);


% Ex 4
% Get data for gradient descent
[X, Y] = ex4_generate_data(200);
iterations = 200;
rate = 0.01;
% Calculate parameters using gradient descent
[history_slope, history_intercept, history_cost] = ex4_gradient_descent(X, Y, iterations, rate);
% Plot results with history
ex4_plot(X, Y, history_slope, history_intercept, history_cost, iterations);

