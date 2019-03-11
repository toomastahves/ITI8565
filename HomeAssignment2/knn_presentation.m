function [best_accuracy, k] = knn_presentation()
    % Generate data
    [points, labels] = generate_labeled_data(100, 10, 0.7);
    % Split data into train and test set
    [train_data, train_labels, test_data, test_labels] = split_data(points, labels);
    % Find best k value
    [best_accuracy, k] = knn_find_best_k(train_data, train_labels, test_data, test_labels);
    % Predict labels
    predicted_labels = knn_classifier(train_data, train_labels, test_data, test_labels, k);
    % Plot data and predicted labels
    knn_scatter3d(train_data, train_labels, test_data, predicted_labels);
end
