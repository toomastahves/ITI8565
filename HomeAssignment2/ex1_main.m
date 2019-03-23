function [best_accuracy, k] = ex1_main()
    % Generate data
    [points, labels] = ex1_generate_data(100, 10, 0.6);
    % Split data into train and test set
    [train_data, train_labels, test_data, test_labels] = ex1_split_data(points, labels);
    % Find best k value
    [best_accuracy, k] = ex1_find_best_k(train_data, train_labels, test_data, test_labels);
    % Predict labels
    predicted_labels = ex1_knn_classifier(train_data, train_labels, test_data, k);
    % Plot data and predicted labels
    ex1_scatter3d(train_data, train_labels, test_data, predicted_labels);
end
