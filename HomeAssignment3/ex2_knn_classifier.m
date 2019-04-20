% kNN classifier
function predicted_labels = ex2_knn_classifier(train_data, train_labels, test_data, k)
    N = size(test_data, 1);
    predicted_labels = zeros(N, 1);
    % Predicting labels
    for i=1:N
        predicted_labels(i,1) = get_predicted_label(train_data, train_labels, test_data(i,:), k, 2);
    end
    % Returning predicted labels
end

% Getting single predicted label
function predicted_label = get_predicted_label(train_data, train_labels, point, k, p)
    % Calculate Euclidean distance to each point in train data, sums rows
    distances = zeros(size(train_data, 1), 1);
    for i=1:size(train_data, 1)
        distances(i,:) = sum(abs(train_data(i,:) - point).^p)^(1/p);
    end
    
    % Sort and find indexes of k closest neighbors
    [~, neighbor_indexes] = mink(distances, k);
    % Calculate mode label value
    predicted_label = mode(train_labels(neighbor_indexes));
end
