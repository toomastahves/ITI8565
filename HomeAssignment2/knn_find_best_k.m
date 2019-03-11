% Find best k for kNN classifier
function [best_accuracy, k] = knn_find_best_k(train_data, train_labels, test_data, test_labels)
    accuracy = zeros(300, 1);
    for i=1:300
        predicted_labels = knn_classifier(train_data, train_labels, test_data, test_labels, i);
        accuracy(i) = sum(test_labels == predicted_labels) / size(predicted_labels, 1);
    end
    [best_accuracy, k] = max(accuracy);
    plot_accuracy(accuracy);
end

function [] = plot_accuracy(accuracy)
    figure('Name',  'Accuracy');
    plot(1:size(accuracy, 1), accuracy);
    title('Finding optimal k value for kNN');
    xlabel('k values');
    ylabel('Accuracy');
    grid
end
