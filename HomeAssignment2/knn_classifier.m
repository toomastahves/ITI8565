% kNN classifier
function predicted_labels = knn_classifier(train_data, train_labels, test_data, test_labels, k)
    predicted_labels = zeros(size(test_labels));
    % Predicting labels
    for i=1:size(test_data, 1)
        predicted_labels(i,1) = get_predicted_label(train_data, train_labels, test_data(i,:), k);
    end
    % Returning predicted labels
end

% Getting single predicted label
function predicted_label = get_predicted_label(train_data, train_labels, point, k)
    % Calculate Euclidean distance to each point in train data, sums rows
    distances = sqrt(sum((train_data - point).^2, 2));
    % Sort and find indexes of closest neighbors
    [~, neighbor_indexes] = mink(distances, k);
    % Calculate mode label value
    predicted_label = mode(train_labels(neighbor_indexes));
end
