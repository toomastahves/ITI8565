close all
clear

[X, Y] = get_multiclass_data(200);
[train_data, train_labels, test_data, test_labels] = split_data(X, Y);
[wh, bh, wo, bo, cost_history] = neural_network_classifier(train_data, train_labels, 0.01, 5000);
[acc] = plot_classifier(X, Y, cost_history, test_data, test_labels, wh, bh, wo, bo);
