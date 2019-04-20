close all
clear

[X, Y] = ex1_create_data(100, 2);
[train_data, train_labels, test_data, test_labels] = split_data(X, Y);
[error_history, wh1, bh1, wh2, bh2, wo, bo] = ex1_neural_network(X, Y, 5000, 0.001);
[acc] = ex1_plot(train_data, train_labels, test_data, test_labels, error_history, wh1, bh1, wh2, bh2, wo, bo)
