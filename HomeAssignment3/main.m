close all
clear

[X, Y] = ex1_create_data(100, 2);
[train_data, train_labels, test_data, test_labels] = split_data(X, Y);
[error_history, wh1, bh1, wh2, bh2, wo, bo] = ex1_neural_network(train_data, train_labels, 5000, 0.001);
[accuracy] = ex1_plot(train_data, train_labels, test_data, test_labels, error_history, wh1, bh1, wh2, bh2, wo, bo)

[X, Y] = ex2_create_data();
[error_history, Y_hat] = ex2_gradient_boosting(X, Y, 50);
ex2_plot(error_history, X, Y, Y_hat)
