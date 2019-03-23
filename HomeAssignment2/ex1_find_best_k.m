% Find best k for kNN classifier
function [best_accuracy, k] = ex1_find_best_k(train_data, train_labels, test_data, test_labels)
    N = size(test_data, 1);
    accuracy = zeros(N, 1);
    for i=1:N
        predicted_labels = ex1_knn_classifier(train_data, train_labels, test_data, i);
        accuracy(i) = sum(test_labels == predicted_labels) / size(predicted_labels, 1);
    end
    % Select best k according to highest accuracy
    [best_accuracy, k] = max(accuracy);
    plot_accuracy(accuracy);
end

% Plotting k value and accuracy plot
function [] = plot_accuracy(accuracy)
    figure('Name',  'Accuracy');
    plot(1:size(accuracy, 1), accuracy);
    title('Finding optimal k value for kNN');
    xlabel('k values');
    ylabel('Accuracy');
    grid
end
