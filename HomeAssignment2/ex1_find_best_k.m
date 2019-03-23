% Find best k for kNN classifier
function [best_acc, best_k, best_dist] = ex1_find_best_k(train_data, train_labels, test_data, test_labels)
    N = size(test_data, 1);
    accuracy = zeros(N, 3);
    dist_parameters = [1, 2, Inf];
    
    for i=1:N
        for j=1:3
            dist_param = dist_parameters(j);
            predicted_labels = ex1_knn_classifier(train_data, train_labels, test_data, i, dist_param);
            accuracy(i,j) = sum(test_labels == predicted_labels) / size(predicted_labels, 1);
        end
    end
    % Select best k according to highest accuracy
    [best_accuracy, k] = max(accuracy);
    % Distance function parameters for Manhattan, Euclidean, Chebyshev
    dist_params = [1, 2, Inf]; 
    [~, idx] = max(best_accuracy);
    best_dist = dist_params(idx);
    best_k = k(idx);
    best_acc = best_accuracy(idx);
    % Plot accuracy
    plot_accuracy(accuracy);
end

% Plotting k value and accuracy plot
function [] = plot_accuracy(accuracy)
    figure('Name',  'Accuracy');
    N = size(accuracy(:,1),1);
    plot(1:N, accuracy(:,1), 'Color', 'Green');
    hold on
    plot(1:N, accuracy(:,2), 'Color', 'Blue');
    hold on
    plot(1:N, accuracy(:,3), 'Color', 'Red');
    legend('Manhattan','Euclidean','Chebyshev')
    title('Finding optimal k value and distance function for kNN');
    xlabel('k values');
    ylabel('Accuracy');
    grid
end
